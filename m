Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0748F606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 15:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VuBXJwB1;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=jQm2Rqxx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NKlfL/cIMbCShlnoUQAoP1Uep9RrtGH8SZf3MvBv2hw=; b=VuBXJwB17vXXMf
	SXhZ+v7SwBl37JS0ftb023oi4oTPnwU1uXqMNZ9BIZLiLn/2y9n8CFVM6Deu3tdSK/MCPSJ3CPm9c
	1sCD9piCKTbQMzPJswuVyjhQs2S8bhDzmieFyPQINDl1pwnYKLE8DO8gI4sZYVhpmpE4YmjJ0Cxwk
	oyVGdb0kNo1Lk/RPXUEdXRNado8GkHCvA1G+9DE8ZN/qy7wyE5uhgk4pe6DudQPMKFyKVr+5W2sfu
	QFeFAsKPjdobHYD3hW7BOFtcjFHgBrstfBOaBgxQQ07c4R8/DhvmoW08KEefCV6A6rr9dTGZfsf2D
	E9vkuzB/tj/+nIZSET0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9X6-00000001GkV-354n;
	Sun, 22 Nov 2026 15:31:12 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9Wx-00000001Ghf-3y7W
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 15:31:05 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso13175995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 07:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795361462; x=1795966262; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NKlfL/cIMbCShlnoUQAoP1Uep9RrtGH8SZf3MvBv2hw=;
        b=jQm2RqxxdLBGw1wY7AdNymqTMIVeH/Irhv5BQax3bRo4cfvFACFwpGAoHdwuz2INYZ
         cOwZO9zN/1IVyzWWoyK9gSHn73BmDI8Mxdy9pfYoYf+ABPIUUrxawpja9jTm/wgMHHLP
         H05vJXeZvF3hVozuybJWwl1wivy5OwKDiYeUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795361462; x=1795966262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NKlfL/cIMbCShlnoUQAoP1Uep9RrtGH8SZf3MvBv2hw=;
        b=jBhz81hHHAenCl6cU9Al8dn0wlT35/ZoG9zRBYpMZ8N56LFbQZJECfdqVuNTKQUnss
         gB5wIpSvNveY8HftLsGyOK2794dZp8dTznsfjbNnmjmBUSRlIaQdjb0mO0mn6kTk3tSf
         d6a05frsxTIhi7i3m+p7UhnQfa0yXxENykvxCBtXy8S5NMgIDZGiBQwEyD375LTx6F//
         OSHcaLmBJx4tJOyMENj+DVOodPI9bzwNC3/6JxdNAfjoxUubO/aX2/H0fdLTQ0dv8w88
         xib7AnMM15ftetX7gn2j3ybeAOnWpEpFueClRd7skcjdLoASmKV6+ulqk21RqbCMScTR
         HsXQ==
X-Forwarded-Encrypted: i=1; AL+hErFZ4WXWjXbwqLelGGCNvRRxW4mvsBXFkskcd1mxRvOzR/IynZ4VY7pHDBlNRJVwaKJMPXjdAgRaf1OKrqQcSeEm@lists.infradead.org
X-Gm-Message-State: APuU4Z9FT2v7XOQvMwaMtXq5jnH0nICZ3PDtkrkTiI6Hi1j/06XLEH/t
	gYOwTl6oGMiq95fE7pTnL7CJVoFnmXDanxNkBWFPwt5ptPLPmi2F2HyuydA56X6BqcE=
X-Gm-Gg: AZFdTZfe/zZOOlHl0fpxme0Q0E0RPb0EKkY31e4wIyYYpqXEchjWlirNKKiLFWribCx
	NAX5DD69zkM7MnAZ45JZvWhMY1U+xLQ7/grESGm/hsjR3au+tbpybwTccgZ3+TTyfcaSzS+Ywzz
	kv0g+gKNnV1/QVAgn3A9EUcbodUZGV5nF24wMbz/IIU6z19wA2f4g64lQqCLBWOz28ijhsai07A
	LiY/JOGULWWRKKTFBidfiGsYpU3f2Ges4l6R47QHUNui+HLW8l6xpzlo1ivhBpw2oDb+hD/M2Kj
	KDmDVecYwl0+MPQUR5NNUgEijJvZxJ+JBDit7xh6G/XJiwve+nz/qeJ6rI3VDfj2YyFISgibsRr
	QYIq2PbPtq5P3cQbiDKw02SHdDrTV162ql4HpECJQg75Vkj2aSHRuKG2xut4LZ9YZ8O49NdRlB6
	rB4eowOqyigK0j31N7CFx23mJoXE1AbmitcZ+X792Fb0EpW47BueZdIlTgOjZ0m2SXymUTqvma+
	Qxep/vEX2FrCU+I0XlQbBPXV8QcxHRMZyaYiyVYNkwkQExndBhd1stVqkWY+fuPV1bMKjDHzxzM
	0fAr89jCMvjh0sA13BOdCRobtiAfheJfgg6DqKjkNZdsSj8T9v8oI+kkVs8nArZHzrLCPUtLzeI
	BsCwOOVJSmvcE0g6oLHFSGkkxwHwxuY1rhLG47z27+oe4gjQiw1NnqaiFomo/dONOl2+YE1r6Qo
	tUKmSYPZKXSNDiyhUso4TkMvaCxw==
X-Received: by 2002:a05:600c:4584:b0:4bb:5de1:e90f with SMTP id 5b1f17b1804b1-4bb88819bcdmr186394735e9.31.1795361462157;
        Sun, 22 Nov 2026 07:31:02 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm237833815e9.9.2026.11.22.07.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:31:01 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Marek Vasut <marex@denx.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 4/8] drm/mxsfb: Switch to drm_mode_config_create_initial_state()
Date: Sun, 22 Nov 2026 16:30:04 +0100
Message-ID: <20261122153032.2782768-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122153032.2782768-1-dario.binacchi@amarulasolutions.com>
References: <20261122153032.2782768-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_073104_145649_24DF0863 
X-CRM114-Status: GOOD (  12.71  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The hardware state is read out only when the initial state is created
with drm_mode_config_create_initial_state().

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 038f5c896dcb..c8bc79264361 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -322,7 +322,11 @@ static int mxsfb_load(struct drm_device *drm,
 	drm->mode_config.funcs		= &mxsfb_mode_config_funcs;
 	drm->mode_config.helper_private	= &mxsfb_mode_config_helpers;
 
-	drm_mode_config_reset(drm);
+	ret = drm_mode_config_create_initial_state(drm);
+	if (ret) {
+		dev_err(drm->dev, "Failed to create initial state\n");
+		goto err_vblank;
+	}
 
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
-- 
2.43.0


