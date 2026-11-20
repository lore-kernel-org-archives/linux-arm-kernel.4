Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6612606A6C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 19:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yLU1c387;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bucLORRw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=KO/bgS9573WdL9OckehiaeYLsdBAM3AUhNlncBXYYkQ=; b=yLU1c387tQ7tfTLvk/Ga6ju4oN
	rK1KveQeGZ2f5P1tdl92Si/AhnQohDpxPzRmYh6jw5wQ2T6Xr4eUJKxNckYcXdI1kUU65QCNowwWz
	FKe4E8SJKsK3f4ZrddQhJctA+PP+eRBDHSz2zCukf/CSFig+0rcMTwflHuyRlfq/R5Y8gAUZwxUqv
	4FippOdT64KLEAct204Sl9IJm+sv9GpI8ky2pYcD9U35xoVXghapVGCvB0ZPGaviYXBCFZgOLQI19
	2nw9qy4Mni6GWl62VpSbSRXCR6IbFyJRRAEDi0CWTTpXOidtzxtV1uu3Ab9gAyXSztiaS2gvOc4A4
	q6o0Hcgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUA2-0000000G3gs-0p9t;
	Fri, 20 Nov 2026 19:20:38 +0000
Received: from mail-dl1-x1247.google.com ([2607:f8b0:4864:20::1247])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUU9w-0000000G3g0-3vvq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 19:20:36 +0000
Received: by mail-dl1-x1247.google.com with SMTP id a92af1059eb24-154e9d2d94fso2819062c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202431; x=1795807231; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KO/bgS9573WdL9OckehiaeYLsdBAM3AUhNlncBXYYkQ=;
        b=bucLORRwVngoiWSmXwz2R//KF3Vi//78K3GUD+TAvjDPg5ojU1JaEWF3JT+kWBxSbu
         jWhjG3hktgk4b6r9tbXS1F0IrTxZnv97a0VybqjWvN2c9w4xItNJ1kUAHkSnEIMNbh3k
         SvXg4XPfctLYLQuY93hF1tWFiM+Dd6mShe+3lsJkNlW9mlfku/mZZaxkrLeJr6O1voh1
         aia8iR9RW6pBJJdTaC6GLUGmvIoirsfCQAdQu99FS9DIHY7ScWMiB0fa/i8PPt4D3cxd
         urJMpqb/qX9heq7N/2sFVdsCGrhjWHoTJv+JsmT2acouDWPKvOqZKmxGdIYX3mbpGcoY
         tTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202431; x=1795807231;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KO/bgS9573WdL9OckehiaeYLsdBAM3AUhNlncBXYYkQ=;
        b=ot0RMMDsyX4uJzSp/yeMHZuOz3q+jCD9KXuo48JcrpUndkQnJebN6/hJcozwL2a5MJ
         B7HM17i8yObT5P+CF1ra10rMFa1QsP/poGK8XarHtiwoUUjB69qXMsP+rDGlLDyzjL16
         qkDSaBlXGsZcD5TwPx4UgvbGwI2ZGs0+B59fXYKGRCL95hpl5AB7DxZjTdMd0GLoCdaM
         9J1ebx3qrId7y4/vSwHkNXu1jaHi7HkjM8jhJlNQZvgyqYNzk7Zl9LnLSTbqlQ6ktZTa
         5a2ur+ORUQqQihPDaf7Kiu15VTKP0xVR9HbyqKTnR18BpatZdipGaylOYZ8FaQv5lP2B
         WqwA==
X-Forwarded-Encrypted: i=1; AL+hErHeAKcUjvztVLkwDMgYbLiOR1FT+CPY1frlZzRspE14S+BMzwJgL9tpXWVAfnQZtyKjcHu7zN5LW52RnEDI8+as@lists.infradead.org
X-Gm-Message-State: APuU4Z/wLdP8mgeZlfxhNHa2wUBseB5rkZxo2xEYCUBDDkzmbFxkdqte
	XesS6Me9CW81WSjPHhVLV+8CAhmBUzH42kTTCJzxwbKUQGMM+nZOXRPeoOxw7o5Lpvm0vX5RdJo
	wrA==
X-Received: from dlbvv25.prod.google.com ([2002:a05:7022:5f19:b0:1a4:c892:b166])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7023:907:b0:193:9aa3:474c
 with SMTP id a92af1059eb24-1b5568a9271mr3806499c88.21.1795202429856; Fri, 20
 Nov 2026 11:20:29 -0800 (PST)
Date: Fri, 20 Nov 2026 19:18:31 +0000
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120191831.2865901-1-elkin@google.com>
Subject: [PATCH] drm/rockchip: dw_hdmi: check IS_ERR() on drm_atomic_get_bridge_state()
From: Elkin Cruz <elkin@google.com>
To: Sandy Huang <hjc@rock-chips.com>, "=?UTF-8?q?Heiko=20St=C3=BCbner?=" <heiko@sntech.de>, Andy Yan <andyshrk@163.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>, Damon Ding <damon.ding@rock-chips.com>, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_112032_970152_2503DBF1 
X-CRM114-Status: GOOD (  12.22  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

drm_atomic_get_bridge_state() returns an ERR_PTR() on failure rather
than NULL. dw_hdmi_rockchip_get_bus_format() checks !bridge_state and
then dereferences bridge_state->input_bus_cfg.format, which faults if an
error pointer is returned.

Use IS_ERR(bridge_state) instead of !bridge_state.

Fixes: dc70272cc184 ("drm/rockchip: dw_hdmi: Propagate bus format to display driver")
Signed-off-by: Elkin Cruz <elkin@google.com>
---
I am trying out a new Clang static analysis linter for ERR_PTR/NULL
handling, and it flagged this code as possibly buggy. The findings were triaged
and fixed with an AI coding assistant, then checked against linux-next (not
runtime-tested on hardware).

Thanks,
Elkin

 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index b6e154c35e7c..30191927593b 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -286,7 +286,7 @@ static u32 dw_hdmi_rockchip_get_bus_format(struct drm_encoder *encoder,
 		return 0;
 
 	bridge_state = drm_atomic_get_bridge_state(conn_state->state, bridge);
-	if (!bridge_state)
+	if (IS_ERR(bridge_state))
 		return 0;
 
 	if (bridge_state->input_bus_cfg.format != MEDIA_BUS_FMT_FIXED)
-- 
2.56.1.750.gf70dc682cf-goog


