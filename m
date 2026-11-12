Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41111606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 07:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RLP8AbWE;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XY61EDMU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=BY8ogzTFjE1WMQglvfjtMG9sRYsnsNS31vRIHu7zQgc=; b=RLP8AbWEdEidpjBTtJH0WQRpjk
	cjwxOzMRrZIuQ9SLMjQB+MW+PW3n9dpjuUzZcM+y8gjIJmZlEGc7eXqc2ST8Tqwl0LkvgGw7CyNc2
	EewNiDDwrfIAVnJiDkGKkyORtdcX/q6zP2c21b6ZWIGSKVjKWe7kr4olg07/TI5kr91DqhLorf58h
	1TSte6m7Kw3M2PaLO0j5f+md2EoWTQ6PevRimChSRuS+faBGUcu0YaG15fefXlZNMABxa00liODs3
	TnQdp974288+yxxYgTTFt1bec6EZ/sQOy9PZgsFWfgVd7XMnpW1OpPncKvFFc+TB6ldc44ZjwChGl
	TXhmpTpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPGE-00000008vxp-3Z4h;
	Thu, 12 Nov 2026 07:30:18 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPFt-00000008vtG-3Fz6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 07:30:05 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so29204655e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 23:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794468595; x=1795073395; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BY8ogzTFjE1WMQglvfjtMG9sRYsnsNS31vRIHu7zQgc=;
        b=XY61EDMUeknNNL2OchSFzkm6p3/miCzoO2BzWDsIHPsd1Nkw9j9Z/0Y4s1iH69Xnq+
         Zn8GasJj62iYIXHgWDA6E/uoU1YN3ektUNcElXVgiugCL81FgfPUDWk8bnSGiIgFGgCM
         gkV+kl6tDY2iqotG7he501LbOHSPVq1RL3+oTEaT3fiqOsBJE+RXs6FfgeC9ObQviqn+
         IQxJviw6Js5Qa50KVODlZ7zf603f66x/SbG3U1N52PJMDtuDDwg5QCN3mIs/v1XvzE/m
         KmKZh0tyCMnDzZbJ+UAqBz7Bmi6RO2p70cDk8UImATfkcztLsKDoPYGHEFE8HG1MfDTe
         4ozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794468595; x=1795073395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BY8ogzTFjE1WMQglvfjtMG9sRYsnsNS31vRIHu7zQgc=;
        b=XQy4KVmLbXOvCzahDltmGWPpxredN+t9vZ+FSk4HNxrPOy/mEm54IRWzvsNsCDbh91
         PDwn46PQIhqh4+cLy7FXLL8cgfNrSXWqBdNwb2MXqyx7eXZ3SToa6Y8TJgIsLHXMVQmd
         eKd6fw2aatF6hqSC/BNK2uMnU5q9csoFDX+6x4CQhWf/APe8zirgmYoJrTMoJMfi8dvH
         IOZVvDuhYx2zNvUKznrDrWBAHTlDLEf2az+J5JHiHPuz9UHZTDxI/H36tdXLJO+eCUv8
         6yHM0AyyZF1YP/fsDX67DBH8aIgJ2oVV2aV9SECFoyAjz9lkny+i3G1Q/6JG3glHwm3T
         m47g==
X-Gm-Message-State: APuU4Z+tgeyLpOUXsrQ9U/DKW+TF6smBrMzF8wQzutFFoUesn/uHU7dO
	hqrkPYoLCz2a4VwEGF+u4lYk6FikWS3pljscd5DRbcRrn/TE3vvu2f1B6B4LTZR/3CA=
X-Gm-Gg: AYBFou2ZasyTVauHwwfZI0olRyRpdP/ydT/D8ZPPvoD/3/ED/xym0Pwec2K38llNs9f
	NZy//jUadqDwSTAMM8Mp57bfbwHBndtt5ieJhSGtErqkdklJC+jNgpnmaTfBpjjmBg2keV6+51j
	H95oWOXwqwTYO8yZpm0JF0XxskqkfBVtjitI49zM5A8bnjdUOEfDppL6VZP7dzQUnCn/PzjP7d2
	FD7EPUAAJUmqjdGA5r2LLL9T1b+/FJUR7plVMsuso/Ff7z71xVFmuqpn2KLczsrxCjdT8ZuNgar
	18w7QBPcIhh1lELDpU7Ser8ZjHQaW4Kl+MZF240zn7gi4coa2eAZHpdqwQ67SssCnHPpBRaQidu
	D66RLWiZ5apjbKtcdCE2jJkZ+HC73uoFt95OQT/MeoHYksj87cCRroMskmY7XOdQDiWsy7go7UI
	MBpEoH4n+pv7bH0IqJPGz3eCU7tJ6BrPX38/vppdWLMcSt5MBYHpTG6JQW7agGzFJXEW5uHBswd
	kd8brCNKrKuxkI9ofRx08vEDLMtGQJh1SwSiDov/1ay+actOycnZq8Ayj28PeT6IRtwDGGnFfFZ
	nIFlnrk8yO2HznJ/n46Rasv1lc53kp8Y0Wk=
X-Received: by 2002:a05:600c:4f55:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4ba0938197dmr97544195e9.28.1794468595304;
        Wed, 11 Nov 2026 23:29:55 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0951bf2asm81897575e9.4.2026.11.11.23.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:29:54 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] ARM: l2c: honour status = "disabled" on the L2 cache node
Date: Thu, 12 Nov 2026 08:29:51 +0100
Message-Id: <20261112072953.989664-1-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_232957_841841_369054F1 
X-CRM114-Status: GOOD (  16.25  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Russell,

l2x0_of_init() finds the L2 cache node by compatible and never looks at
its status property, so a device tree cannot keep the L2 cache off.
Patch 2 makes it leave a disabled node alone; patch 1 notes in the
binding that the firmware must then leave the cache disabled.

The user is the ZTE ZX279128S (dual Cortex-A9, L2C-310 r3p3), where a
PCIe read on one CPU deadlocks against an L2C-310 line operation by
physical address or a Cache Sync on the other CPU, and the board hangs
within seconds of WiFi traffic.  Running with the L2 cache off avoids
it, and that was suggested as the fallback for the platform when a
lock-based workaround was found too invasive for generic code:

  https://lore.kernel.org/r/20261110153522.1620088-1-isasmendi.agus@gmail.com

Whether the ZX279128S device tree disables the cache is a decision for
that thread; this series only makes the property work.

No in-tree L2 cache node is disabled, so existing device trees are not
affected.  Tested on the ZTE ZXHN H3600 (not in mainline yet, on top of
Navid Ghahremani's v2 platform series): with the node disabled the cache
stays off (control register 0) and the system runs normally; with it
enabled the cache comes up as before.  Builds without warnings with W=1
(board config and multi_v7_defconfig); checkpatch --strict and
dt_binding_check are clean.

Changes in v2 (after Arnd's review):
- drop the clean-invalidate-disable path for a cache the firmware left
  enabled, and with it the "factor out the number of ways" patch: the
  firmware is responsible for leaving the cache off, the kernel does not
  touch a disabled node;
- new patch 1 saying so in the binding.
v1: https://lore.kernel.org/r/20261111133930.3665251-1-isasmendi.agus@gmail.com

Agustin Santiago Isasmendi (2):
  dt-bindings: cache: l2c2x0: a disabled node is left to the firmware
  ARM: l2c: honour status = "disabled" on the L2 cache node

 Documentation/devicetree/bindings/cache/l2c2x0.yaml | 3 +++
 arch/arm/mm/cache-l2x0.c                            | 5 +++++
 2 files changed, 8 insertions(+)


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.30.2


