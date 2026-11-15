Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053A4606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 18:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iT2GNsZ7;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WdhRq+ck
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=COi1K2R59U4ZncYnAMKGjrp6Y9UhfY1ThB0yXv686NI=; b=iT2GNsZ7T0TbeYLGLZ/f2IljvX
	IdEVGqOs2VE2SR5YCo2hzLHbNRBjlaQnLJNAGQBBF4Hm5kfg89vRR0B8LfX1wdTXYFGC/V5z8h9Vv
	nyeiQ+BMwD5U2R2efEugGS5t8Xf4x1WZ5XMHEJ6kJ3VvI+WO1IbvnysgZJlOImWKLomHm7m09nKg+
	FW9R+cpi+wwj+Pqg64QUxmKKeDRdnXltEmM1OEfn3BhlBIxeFlt01RDAchpDEUkoYz9W4Y3J9eALF
	ioqBEAgT6yS+bCOGGgiNjdUsBBJk0jwy4O7qICuf0X94HOmQs/TGTYck/gEM2CnAi2ausi79UNdA2
	sKgmGk0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSeYH-00000000IUV-3r0Q;
	Sun, 15 Nov 2026 18:02:05 +0000
Received: from mail-pj1-x1047.google.com ([2607:f8b0:4864:20::1047])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSeY6-00000000IPN-1Vtz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 18:01:55 +0000
Received: by mail-pj1-x1047.google.com with SMTP id 98e67ed59e1d1-3ac8f449d1bso2001292a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 10:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794765713; x=1795370513; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=COi1K2R59U4ZncYnAMKGjrp6Y9UhfY1ThB0yXv686NI=;
        b=WdhRq+ck6vsxQjSPM6/qjoadxmfc3CPe1qKa7k/v+7Wt8Y8DoFSQ6+Eh7lP2zlaBJ3
         4AZpY2AKbcXWcGQppsJ5PgWrx6IvCH4erQwaMEbKvfO/eCaSX8spSqfLTl6W8NZ65fxB
         GHzlMx2xb1qx7I/N5ZWvs4SGLv69RWbcrwaHZQz4KzdHuWm331T0YJZilSGP5PEJ4IDx
         LWYKZO64x7av/gMV5aHZ2g/CfkmXMQccRg/9GcjacyAWsaT8bppSzzYIYqLly3VQKxOj
         j/9UXBG94paZa+u1Fpxje6NQ1BhttCZmSChUa5/uocVHF/KIqKckIiMKo+bDVqWebSRT
         K/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765713; x=1795370513;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=COi1K2R59U4ZncYnAMKGjrp6Y9UhfY1ThB0yXv686NI=;
        b=VtlZCW4h1OCsfwcCDEMLLi6Wy5ECMGIsFFxIW1EWqLmjp7wCLsV5Sm/oNPpdIggmOc
         NsBCZSuYSPU0py6+5mvifBsXjCTvCaG9BbbUnxLTlMHtuVfWRQz7fMGAr81D8Bbr+rz4
         pQzA5Wk/CO7gRyvjoHFWNFLCrKQ3Foyq9uf8p+z9s9AdHEpo1a5E+/pJgmuwk5n0df7I
         6Hyze6knIyZjMz+ThcIxGrqE73Dzi+OwQBgpSnAsR5hzrTIQjrnqHI+rTkKV8+z4e7al
         EfOw7NPOLE40oWs6X3+0DN4kOIsudxine0hRa0NGdPnEYtXOnzbMLL+plp7Cg4oUc+V6
         ofuQ==
X-Forwarded-Encrypted: i=1; AL+hErHvMMPRWFfCHm3Hwqb/hhwx60m/kb64GNqs4MuPrGcAPuuAlt6kobXpu4GQZo1r/E4klaT5FgtAz2NTkGk5NORH@lists.infradead.org
X-Gm-Message-State: APuU4Z/wwg/dixNwlKQpKQFVtf8SNRb7Jv6IrfOE20fYoV0VkIy2enWu
	PPfWJ1iovB71xzK/m9H4oRHONanTu16gHoRD/xn/1x5Z/UgXjoWB/Jx0KD7LnmupgeBnOd8QfV4
	CNCKJLL9EKrFkYsGG13R5NSsbJRveZ84I7Q==
X-Received: from pjyq1.prod.google.com ([2002:a17:90a:e081:b0:3b0:99cf:4070])
 (user=vamshigajjela job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2246:b0:3a4:945e:bc33 with SMTP id 98e67ed59e1d1-3b1b0ba1c76mr7285600a91.47.1794765712405;
 Sun, 15 Nov 2026 10:01:52 -0800 (PST)
Date: Sun, 15 Nov 2026 23:31:45 +0530
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261115180147.1208082-1-vamshigajjela@google.com>
Subject: [PATCH v2 0/2] spmi: Add SmartDV SPMI controller driver and bindings
From: vamshi gajjela <vamshigajjela@google.com>
To: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: "=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <u.kleine-koenig@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Jim Wylder <jwylder@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Vamshi Gajjela <vamshigajjela@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_100154_404991_11B3BBFF 
X-CRM114-Status: GOOD (  12.66  )
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
X-Spam-Status: No, score=-21.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Vamshi Gajjela <vamshigajjela@google.com>

This series adds Device Tree bindings and a controller driver for the
SmartDV Technologies MIPI System Power Management Interface (SPMI) master
controller.

This IP is integrated in Google Tensor SoCs starting with the G5
generation (codename: laguna, canonically written as "lga",
"google,lga-spmi") to communicate with on-board Power Management ICs
(PMICs).

The controller supports MIPI SPMI v1.0 and v2.0 non-data bus commands
(RESET, SLEEP, SHUTDOWN, WAKEUP), register read/write, extended register
read/write, and extended register read/write long transfers up to 16 bytes.

Patch 1/2 documents the Device Tree bindings for the Google LGA SmartDV
SPMI controller ("google,lga-spmi").
Patch 2/2 adds the spmi-smartdv controller driver.

Changes in v2:
- Dropped v1 patch 1/3 (vendor-prefixes.yaml) since no "smartdv,*"
  compatibles or properties remain in Device Tree.
- Dropped standalone and fallback "smartdv,spmi" compatible; use only the
  SoC-specific "google,lga-spmi" compatible and renamed the binding to
  google,lga-spmi.yaml (Conor Dooley).
- Dropped all seven "smartdv,*" DT properties and moved the per-SoC
  CONTROL register parameters into of_device_id match data
  (struct smartdv_spmi_config) in spmi-smartdv.c (Conor Dooley,
  Krzysztof Kozlowski).
- Dropped "clock-frequency" and free-form clock text; made "clocks" and
  "resets" required alongside "compatible" and "reg", and switched the
  driver to devm_clk_get_enabled() and
  devm_reset_control_get_exclusive_deasserted() (Conor Dooley,
  Krzysztof Kozlowski).
- Updated company name in descriptions/Kconfig to "SmartDV Technologies"
  (Krzysztof Kozlowski).
- Removed <linux/mod_devicetable.h> include and changed sentinel to "{ }"
  in smartdv_spmi_of_match[] (Uwe Kleine-Koenig).

Link: https://lore.kernel.org/lkml/20261103042608.387626-1-vamshigajjela@google.com/

Vamshi Gajjela (2):
  dt-bindings: spmi: Add Google LGA SPMI controller
  spmi: Add SmartDV SPMI controller driver

 .../bindings/spmi/google,lga-spmi.yaml        |  56 ++
 MAINTAINERS                                   |   7 +
 drivers/spmi/Kconfig                          |  10 +
 drivers/spmi/Makefile                         |   1 +
 drivers/spmi/spmi-smartdv.c                   | 488 ++++++++++++++++++
 5 files changed, 562 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml
 create mode 100644 drivers/spmi/spmi-smartdv.c

-- 
2.56.0.611.g1030f0b940-goog


