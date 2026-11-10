Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC8A60A3827
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 21:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dLyPwv6X;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nQOipoh5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ctVOchLtZ/i0vJd2/vqfjh8ZPAFvZBxtNydVJLZOi7Y=; b=dLyPwv6X77gBNw
	MIIDd3O+4I6j6KvcFUI/0rWmErp163lyWgH9qh4TWtqWPigGfM2K8SmqBtCyMA6jso+1n37993V7j
	WoPuQU4JOcnnBWuaEYOmfjbsrd5pZm5E6QaI55P9gGhe7LNMCJ4Bs88vHEb8pfkRwXvmXU/YBpiAX
	X2QwIMGcElIUvWhaQ4L44SkzdCdBrWw73c1wb+CIXBfy/dSrr86FZPwpF6/Z+JCMhR3x7Ru1djVVQ
	4/WrS5E7QksVB/okBu6QUZPAahS1MC9LeG7M0cln0thdj03NUNGIDmjemG21jpJgHeD3XUI2L7bWn
	wcmF/iasKWXrS1TPWa7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtox-000000055xS-3BPz;
	Tue, 10 Nov 2026 21:56:03 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtov-000000055vM-3Pyh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 21:56:03 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so901313f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 13:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347760; x=1794952560; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ctVOchLtZ/i0vJd2/vqfjh8ZPAFvZBxtNydVJLZOi7Y=;
        b=nQOipoh5XGweOz88AhMKP4W2By5Gd80K8If3QB1lzQHam4MQN0WT9u7/lgeBcOcdT9
         xKOlsBa9uvvWo4BxXk3eyiwcIXAmmqvec/mMH7r40NSquRFpRq6NBZkJDsQQLp42yKI6
         3QVpfv8IWtmHj+D0YTvanr3YZ/Uyad7zIvPsG4flybSeg5Vn+O3ieKG3G/Bh1ZbBWsuM
         ftg6lgi3/4uF3EuV2t8ahL13dESRhN7p/CmM3XJvSWNeo524sdODs8xUWjB1DSgkvwWe
         IO6giMTOI0A8ZXKMRCcmIRkPOXOn9EDaFkaT/n5fOG9y6H7wG1knfP85oiAU5C0iD4qU
         8Z5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347760; x=1794952560;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ctVOchLtZ/i0vJd2/vqfjh8ZPAFvZBxtNydVJLZOi7Y=;
        b=2hF/eXNjGHl16MBKRb1eoKCv1YzgABknKN9iW2/eErR4RjxYYSpU0LvMqadg2Ntj4y
         gW3drEufXmcBRibo8bytRhj147wfH7BoI80ZF9XZnUY5HHGdetJkBfcWb4NIw+ZSzb7x
         hqrysG2pmgsjkhwEaqgMtI6sVJtgahc68twE4pLyRN9WUnU44mGpVzKwmOS6vxLEC5Hv
         0ZB+5muBhwgkDD9p29o1kokRsZN6oDHX8C1uVWUMprwMDvrbelzCEarDiPPWNI63bqtA
         05dLvtC0JNWuI+2Ziwb3L7xqk6CQOCHQO5PSCE7EydeWTJyZW9QBEGmIW6m3z2ZV83Ld
         7GRQ==
X-Forwarded-Encrypted: i=1; AL+hErG7HxXRnxxoc/WQPqEG2/CwHw4bKZmwZMRPqC5rL9q/0NT2Alwjf8/vo7SoNW6UReCEFob3Gsk0ji8ev5uemzek@lists.infradead.org
X-Gm-Message-State: APuU4Z/J7+PNlk/tlsoD08xwb3PUSdbW+uX+Tg4SA5sKGJKV6zK3MVS9
	1qJE0iSqrlLo3x2mWtLcxGlkEbgZEVvMAoNIq7623oYAxj0ItPjmpoqDtjb70ivQbCYaTp/jTzE
	//56gzwc=
X-Gm-Gg: AYBFou3vpqj2sW0fED47Ol0ZP46zo+qB0E+TqCDT/T0qy4mfSRb1MmeG96vaaQVDYJ8
	VsPGFW5qxutzbnjLXtUY259EceWS85LaI2QOLqBbIRWoKk52dTIquuAq8AfIS4b8+kvkYwwN4Nm
	fpBREiWtQrt2GHq9AlRV3XC4evsJynKLRzQJlV9x0rULxKb16v8IPpKt+AmR5vb35r8yGwUYtn1
	3K+lQdER9JQ7i7ecbXkdUbKolTGM4NSZIWFhcHtCndJe50EkDGolGcSauygNtUEPWz7zGOvuiLQ
	W6qax5Oev7r8K0D1ADJvhtkw7VDxDoAgIFDEzXoWxd45Gmbn/Lu4gh3mWTSIQTEaAfD5P+8fiuV
	Q9cFsMM7SEyf04Uw1HZmwgKU5v+skfxIRnNlehfbrmhgcwUeYObWlbZWVKa3ic6yTZIAiogHIR1
	MASa8Xz4psa7K6h7BFjh5Amw4KJyAE/WQglUwpZ2NRi9G0FJNw4ap/NkVPt0LcycYM/g9okwwOa
	QpHIGiYi6UVRLPh8nSzQC3qVvALY9yVIq1auPgACW3+3S3hHbonavyyZZ3Ytl5cbvs6rorvYlES
	laWm2b5/h5Au/LrbmFzzGE7G9sCKqsMwqw==
X-Received: by 2002:a05:6000:402c:b0:492:820d:107e with SMTP id ffacd0b85a97d-499c792ef4emr428787f8f.47.1794347759890;
        Tue, 10 Nov 2026 13:55:59 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4988bdef64dsm5664845f8f.20.2026.11.10.13.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:55:59 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 05/20] mfd: mt6360: Drop irrelevant __maybe_unused
Date: Tue, 10 Nov 2026 22:54:30 +0100
Message-ID: <f24ff673333c0fe34408abf1a4f013eeeb5b63d2.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1019; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=WVXc1FvtvHtwehAQUPEvKaZfuWX+hZavONn/+2WOSYw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85KisuoYTGXVnjuOAoBv1WtV1Dwwmw2ojVv8v Er1hTByizaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOSogAKCRCPgPtYfRL+ Tt58CACDo/1F4WSgBgjg4oDThZrM6JlYHXkQrOBvMkMkN/laIz2ikPQOpQcH6kb1HJ8KJICzPkL nfRlyhLgE/4bzVPNjE3WM5My9hgSQ4RpVWEWH60bylCAJ11pxX2cVVohWpRVn+y+R/9aa/4zl3L rvKkcDx2LZHxL/56lhEcX2R4suG/y5AkIlhXL1SAz63gSvvtJJYRPrnEt9TvbnByWDDTe3MYns7 odPfiaSK40lzbMugKCueM5ixaCZQBeGFzfqChaFn3vmtjN/AYYQ+vk2OVcJDXbDbkLJaLH5peEc R/SfnNv9Eoz8HYLAASLC1o3YqZMqweOx9lMdqz/6Z9nDEq7I
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_135601_893548_A2B977F2 
X-CRM114-Status: GOOD (  14.27  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since commit 5ab23c7923a1 ("modpost: Create modalias for builtin
modules") MODULE_DEVICE_TABLE() is enough to reference a device id array
even if the driver is built-in. So mt6360_of_id[] is always used and the
__maybe_unused marker serves no purpose and can be dropped.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/mt6360-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index 8a97c30cad3f..8263e3ff8315 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -606,7 +606,7 @@ static int mt6360_resume(struct device *dev)
 
 static DEFINE_SIMPLE_DEV_PM_OPS(mt6360_pm_ops, mt6360_suspend, mt6360_resume);
 
-static const struct of_device_id __maybe_unused mt6360_of_id[] = {
+static const struct of_device_id mt6360_of_id[] = {
 	{ .compatible = "mediatek,mt6360", },
 	{},
 };
-- 
2.56.0.rc1


