CREATE TABLE public.generated_images (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  prompt TEXT NOT NULL,
  style TEXT,
  image_path TEXT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

GRANT SELECT, INSERT, UPDATE, DELETE ON public.generated_images TO authenticated;
GRANT ALL ON public.generated_images TO service_role;

ALTER TABLE public.generated_images ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users view their own images" ON public.generated_images
  FOR SELECT TO authenticated USING (auth.uid() = user_id);
CREATE POLICY "Users create their own images" ON public.generated_images
  FOR INSERT TO authenticated WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users delete their own images" ON public.generated_images
  FOR DELETE TO authenticated USING (auth.uid() = user_id);

CREATE INDEX generated_images_user_created_idx ON public.generated_images (user_id, created_at DESC);

CREATE POLICY "Users read their own generated images" ON storage.objects
  FOR SELECT TO authenticated USING (bucket_id = 'generations' AND auth.uid()::text = (storage.foldername(name))[1]);
CREATE POLICY "Users upload their own generated images" ON storage.objects
  FOR INSERT TO authenticated WITH CHECK (bucket_id = 'generations' AND auth.uid()::text = (storage.foldername(name))[1]);
CREATE POLICY "Users delete their own generated images" ON storage.objects
  FOR DELETE TO authenticated USING (bucket_id = 'generations' AND auth.uid()::text = (storage.foldername(name))[1]);