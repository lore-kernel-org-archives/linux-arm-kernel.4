Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B1C606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 12:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iEB9WStw;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g5KdVzMH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=crdLSmlfnO7VKMZXhE1g/GIeZeZ2qlXrtngZdD7/DKk=; b=iEB9WStw/+qEXetk53nl+aKzZ6
	qFfw2K3DNkQgoBWGXJYZlgZj8aiBT+dhvt2YJarV25xABB3GFt+M088Bmoe3IKtRnIVgTG7gcV4S8
	1P1IKeSNG7GP3R8svYMUW24H70kLu5K+uvYx9ZI0EwZ8gW+h7Tw7eoN+aE56Wp0cDFmDlbBIWTxPc
	vgSVbSQbb15zC1LQZCXUTB60uFRXXuxntzaSTIwY/TOw4zSbiyQdZkGY8VNP6NIVujYIKUE8bw9tk
	Sgr0JaTueh/XiXZeDjYYrKLpdaO1UbJi6A3lGdydnwNoEbIgMYsZi1LPI/tLJx5Rrx1xA6Y+gEYKR
	Xcjy7yng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvYx-00000002JMR-3YpZ;
	Mon, 16 Nov 2026 12:11:55 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvYv-00000002JLf-1jxH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:11:54 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48fd2e38825so2116454f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 04:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794831111; x=1795435911; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=crdLSmlfnO7VKMZXhE1g/GIeZeZ2qlXrtngZdD7/DKk=;
        b=g5KdVzMHXKzvkYz7hol11XVOjIGh1KTnTXBTN08GTdOUCSTsoy3ziYULtm9WNxAUky
         TBskXm3cTuXyYNpnu59yZuf3ikqlFkzYmT4fkeC1YY35vIwIJERJ6rON+mVN9wrFySyg
         Rsz3SIS+X+W/5BrG3vmDutNS8gVbgaTJfluLhvS5DIqgDfHuxESep4ZieyDt10vb/q0/
         qpFbTCmJGkBBA+pYtmJCbDIT4J2ZNujhZHLk/LFZyIoE6ZzBpTI+R+du/hGVCgStVVGy
         u1RrqSB/wkyXgXmhlxK7nRl0/CB2o44usFzNCoj4Fk336Dv1DWo5ZAsh8Axf7jeE8MT7
         rBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794831111; x=1795435911;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=crdLSmlfnO7VKMZXhE1g/GIeZeZ2qlXrtngZdD7/DKk=;
        b=zlEIfpvWLnaQaHhRGh5W1RdUqEAF1UEqfAqovkLpnzIne73HtWG+PRcS9Tjwxn21Sv
         TXaj9UJpN7tiYbkb/P8lOc7qypL9d3G4hwZ/LxHtW5635dbwObOHCc2CaJifjH+ClyL3
         NTyaPF86LA5ssrF1tRSIB+5sBvJ+UiEI08S6ASQ9fiENm3x7Dc1ekYnqNlzFDF+bs+8/
         8IGFkrPscs6oWfIz/4GS/KE/N6suTCodD6Tk845/PpPuu5PDew3NmBz2ps/DE6mlWyXT
         jftkAvL4JCfOv7HURzkRGMBiyj3dYSHWRsOkt7pr6Y7v8P0eljk3qFnmns78z6RbYygQ
         vPOQ==
X-Forwarded-Encrypted: i=1; AL+hErFB/jX3rtuOoN0Rr33Lp3DGuu9G3JaaEmCu3Xr12DGB24pAeC/vPr4x8N2I98SC1edJ9AYRg9JdCOSgzpFKrHzk@lists.infradead.org
X-Gm-Message-State: APuU4Z+bYKCSYsRJXM5IWtl3aMd//G4nqufiEoDqYtsEwkBsNnKBRZAl
	DqkxMlUYSAv5yfeTd8u4uzuI8sgVLGph2P+sZ7k6dAuA8a3B6bw+cWr4
X-Gm-Gg: AYBFou2HO3xeK1qQ24Lo+GbAQpoB/8IdTZQ4sMjvZyfNaiXhDeQOy+oRCdW1TruKkuT
	69JjVuFUaHZ/BXX4okut9Gnr1103P+wqMzBLfuhLcCGVvKS50zAJZc8NRX+OfTJGcMPfOf1MPwQ
	VSQ204D6DfaFLfdimFa7E4pKNOEsbwdqtUWIAd9AEnY5M30zjLFS7VRRw/xF2KWegW4bRyS6atM
	q6uN8yds8w+fzJYaq1BpKswP+ZHR6lwFwoTGCmAPrbleBwX9bx6Anf86PfceGte8PNUUb+rKHL4
	7sKBDTY/QYVOTlsBzZ/OwgGVa+gfasXJFaG+vqnAgySfDLLqR3oaYCtK5mpLMCLB5Q5KYv1JWiw
	9Hx5lXE9CzgUE9iUWBMH2X7hEywDS0fzkby4LdCx/6e7y0MEeCjf/6cSKylG2ccPcoPQ1Z+kT2H
	1lqjlD5YX0ehZMCV3TefQMhodRTTyE8R+c6zTdLwBKUmo+3H4O8n6rA7x30sh6vDhIQ7iHi7vYx
	Hnc7dRwn7zlzFFyh7tfW027DuW0DjH6BHfyIcbY/+AwDhSF9wOn8JkAtFxABqIRP8oaai3riepE
	Yzl0HZ/5c8v1CAYqt7NlCAMRVOitMqQLs+i53w8y261GQ8S2325R+5ikiTC+DHK7BZNI1nHqDu3
	jevyjHaUbtnefMuCZLG7F/qUi7ddaxGeUJw5HD5gnoeJmuQQwiwHaGF6b8LeY9X70bzh58x+m
X-Received: by 2002:a7b:c009:0:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4bb55a832famr162798335e9.13.1794831111064;
        Mon, 16 Nov 2026 04:11:51 -0800 (PST)
Received: from localhost.localdomain (80-108-121-211.cable.dynamic.surfer.at. [80.108.121.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb70105a98sm61442005e9.5.2026.11.16.04.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:11:50 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Subject: [PATCH 0/2] MNT Reform 2: Fix the internal panel on i.MX8MQ
Date: Mon, 16 Nov 2026 13:11:47 +0100
Message-Id: <20261116-reform2-internal-panel-v1-0-765cf8d5ff4f@igalia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqDQAwAvyI5N+BGuhW/Ij1Em7YBjZIVEWT/7
 uJxYGZOSOIqCbrqBJddky5WIDwqGP9sP0H9FAaqKYYQIrp8F58J1TZx4wlXNpmweY7ti5iHgVo
 o8Vo8Pe5x/875ArE+tEpoAAAA
X-Change-ID: 20261116-reform2-internal-panel-35c872aabb28
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>, "Lukas F. Hartmann" <lukas@mntre.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Christian Gmeiner <cgmeiner@igalia.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_041153_475244_AC6823F7 
X-CRM114-Status: GOOD (  11.01  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The internal eDP panel of the MNT Reform 2 with the i.MX8MQ module does
not show a stable picture. There are two problems.

The panel-edp mode for the Innolux N125HCE-GN1 is a 70 Hz mode that is
not in the EDID of the panel. Patch 1 replaces it with the 60 Hz timing
from the EDID.

LCDIF underflows at 1920x1080. Patch 2 connects DCSS to the MIPI-DSI
host instead and leaves LCDIF disabled.

Patch 2 depends on patch 1. The video PLL rate in the device tree is
four times the 138.78 MHz pixel clock of the new mode.

Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
Christian Gmeiner (2):
      drm/panel-edp: Fix Innolux N125HCE-GN1 mode
      arm64: dts: imx8mq-mnt-reform2: Drive the internal panel from DCSS

 .../boot/dts/freescale/imx8mq-mnt-reform2.dts      | 52 ++++++++++++++++++++--
 drivers/gpu/drm/panel/panel-edp.c                  | 15 ++++---
 2 files changed, 56 insertions(+), 11 deletions(-)
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261116-reform2-internal-panel-35c872aabb28

Best regards,
-- 
Christian Gmeiner <cgmeiner@igalia.com>


