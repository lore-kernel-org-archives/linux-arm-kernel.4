Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE7F606A337
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 18:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iYAYc2Df;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e3euBy9l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P6HQLmDONZmtH2MpuLzcBkexLz8WC+2AFafcuCT9Xu0=; b=iYAYc2Dfy+lRGB
	YkNWYLNxox6X/4nZzt1pEdbC16IvR7rG7Q+hWnOyO2Y5sRX/Ui9+xrdY2plpT0M2JckEGyg953ZZh
	bzAVRkB10DGhO9vZmH1CORnXvV8J3jmwYxT4QeQH4RhtxpoCBDsOGkTGe9IyID5P5RkEp325ohhAu
	IJ9N7Tv3wnjMLhjRuOQLqEK35slBg6WVjDZ5oBGG8F0+0gAWAaxUBU6mxWlN1lbeJnMRocMFEK9PJ
	b1kSAOzuKAUzPmxKs8+ZeKM04BGZTBQnJF64TT/w65VpXP4aDCZxudpvHqORu9sBnwvMN+9knYX0/
	pWPeCdGDgvb8w/fc2fNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPl3f-0000000F9yX-2cfq;
	Sat, 07 Nov 2026 18:22:31 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPl3S-0000000F9ow-2clS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 18:22:24 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so16932215e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 10:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794075736; x=1794680536; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6HQLmDONZmtH2MpuLzcBkexLz8WC+2AFafcuCT9Xu0=;
        b=e3euBy9lMh4wzZ4hiYzFoMI/yqKP21W/t17nxNcSOY3VLOEV4A5cCEB47VroLHZjve
         HORMGPnm0v5qhnZDBLh4Wx1ag+MRz5M0A7PA3Ylq+juMk9a3bhfg6qm/QNTHeamGXFdj
         kYi/v+EIX49gqh5srMUT5/2456RYlUqMEbe5hWLPIQeHgxg17cXc6uBqktgHMEbbWDu1
         1IDNv5QCD7OduHUJTKAYJdXcpGXWYb2NUkdn39RDp7kQ8g/d1jRD1aUjV1jTv5CLjHMb
         0oNN1UYLz7UwPC2SrmsM5qb6vfdPNqUh/aaF5on3orSfkdROLkHQpfCz5mzyv5+G7mYw
         OaxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794075736; x=1794680536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P6HQLmDONZmtH2MpuLzcBkexLz8WC+2AFafcuCT9Xu0=;
        b=iN3eEfcBGHlUyReNcsLLPlJ/wXMnyPXzaNtKM/BbHHMxXhI4hFjFSZRhqCDzaXiP3g
         /EvpOx/84abKNiposnO5Z83B72qRu22TnNjLcHKp02cKvlpSynLYGhl/sjTZznRiKVPe
         j+6T9+moffTsBquxGfS14XGkS9cKbrw+MPH8wMMb3ztILGSt5AVgK/Yw5GEUCpCDKLAu
         aUszOkFcK+WmuiLTUucRA8gQqFhdBVT9/Jd6upj2JEm3rhyyi4XrAjcouZJ6ozTw5UnK
         swsTA2a+sjUD5n9PRs14+QN0/vIi1pSze6g98wn8+EyN+Vfu6BUbHFJai8rcEMDOwCFE
         r6YQ==
X-Forwarded-Encrypted: i=1; AKwUvBwk755DrhfuI/avyFoENqHF9TFNGQWpKrort+QqDAeVj8m12OgafOyHOz3L6DgYqt9uxPA6cbzCsb8S1D+m2boa@lists.infradead.org
X-Gm-Message-State: APuU4Z/4roMRaforncmKf3u01oERgRUs6LWIsDkCvcSSPSVeOvQZ/rK9
	kV2iG6xFXQxYBQJWmOTKsp4wK1FMMbpllas2fct4PJhY+WPOL39faNXw
X-Gm-Gg: AYBFou14BhQxNpHecUKJEWkfqIYvUDy8flTO115iolZnfzQU1j/z7madQYUuyfYvHvq
	3Xuy6mreM2m+U9IU5Ls5VTE4eT6gz7aKNmTyrr+QjhdiEEvACfBXQtKcXph5cV2Lpvfc98lelU8
	S62WJHUygXL7eHqmLBW9p/vGWiDlxi54pgmy+tmbY3LaD+AYqOzpTLaGDrJWdWOyvCUC1aECvHT
	lrp82FBCm6szEkhSZ/X9SmiWG7/17FhhzKn4y22hVLj5XXCr2bd7JSisH3sm7yC8wzd6C2+Ev4O
	+dFqTzeWHIMatIgRm1Ri+cJRJgyPBSIIFStiGRDS6OYoe+H+DjK3UF8CgWcphcMQwvZL7Rimncr
	oKOVYF3AfhCk9NrXhCN23fhyPhz8/Obz3RbkdeGz7by4Bp+kTOSp9Hxao+yW8cEMWSHwDnpiHzx
	314MW4/uYOwm0bDNhLr4w5g+gsXl6bYJhIzmk3Dw6l1rRWvBFfztNOjNkKcMwv5ps3mqvGeb/jU
	aoGHGetkD6JOLNaz9r8a2ZAhb9qeUDl6+TjZNWSOxmoFpA4QnopMQxI15lL6WFJWYi7RQrIQZ8J
	bbS2wDUWRjhzCE7DExYcIaMDEyw0fNpIRY8R16lY3ux/y69ROZiiiUOfe1g2WBoWBpnXWJ4Lo+6
	YDW3z84JkT8tX8Z8=
X-Received: by 2002:a05:600c:1c10:b0:4a2:150f:1601 with SMTP id 5b1f17b1804b1-4b6dea68fdcmr114855105e9.12.1794075736554;
        Sat, 07 Nov 2026 10:22:16 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbd082dsm59551055e9.1.2026.11.07.10.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 10:22:15 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Sat, 07 Nov 2026 19:21:33 +0100
Subject: [PATCH v2 3/6] firmware: raspberrypi: Add blank line after
 declaration in probe error path
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-fix-raspberrypi-firmware-v2-3-5bfe605a5cc5@gmail.com>
References: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
In-Reply-To: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sander.speetjens@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=704;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=S629c7Z4Xh+sglZqK1vBTNUvrddrb3hrJoBprGdVlMI=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq72xVD7jrzsTfAvYRAS4hITjM4b7vqYjOnYq9m
 07jEUVnq2yJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCau9sVQAKCRB4zXhFDAXI
 ZyJ3D/99hYLHx+dhJRd45sfqNDXZV/1/AM2Rsevt1sVyq7CnhGNvtw8gHYG+X3yqIM8TqwMCYFa
 UImCbRPAO/pK9wZUt+nIkOFNZWcVXnRXIlRnivtBXN3qBEREj6I9oEcIA3swmSYawXGhi7suTSC
 fcM2zzrV2uS+3d0gdE6jX9MC+uiIjcaCoGBYyhawXP4p62UkbLhdJqJXuXuDg0yLQSpJzrIeJXr
 3PN1+UjgCTOvlutiAE8W9QXDQUNk/fsV/4nHjynKSu6GFO1/LyBldF0c5RcI2hCX0xJ0BKXErIo
 pu0e1pB55/W95fgz0dVh+7DJp2cvx3M3kHAYxez0nWNJoMe87MOJad64nCU9RaEro4f3NT8wh0T
 yQWc6aExyIahNXGWj4HiOj+JGlDyMj2+71uFI9MlT7ojYcMC6xql8a4MvVA8QS0mIuXWNUg46ce
 ihwm6eYwhBse4MuW6vwmoE9ksebaQAAp3lvRbrSkwXdoYkwnhG9LzzGZlqvVeKqa+s1RYj6BN/O
 4Owd+4ej3fo09Ih/G0yQ9TRoFajAAIW/LoYdEMGv7MclJy5dU2kDiJxSQtMPqV/xM7Sr8Rt99pd
 YrgXz0t0WS4vOlwOhqMLyKvwHFCY01ybj87IhB0qLNARXNZXXb0EEr2ZIkY+BSzSoEltWBHb6zF
 RkdnsmUstkaKABg==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_102218_687342_44E559A7 
X-CRM114-Status: GOOD (  10.33  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the conventional blank line after the local variable declaration.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index e0c91719b4d0..04163c3f385d 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -315,6 +315,7 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 	fw->chan = mbox_request_channel(&fw->cl, 0);
 	if (IS_ERR(fw->chan)) {
 		int ret = PTR_ERR(fw->chan);
+
 		kfree(fw);
 		return dev_err_probe(dev, ret, "Failed to get mbox channel\n");
 	}

-- 
2.56.0


