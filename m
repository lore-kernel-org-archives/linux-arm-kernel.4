Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B5C606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 09:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vvEcqygt;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=E9sPEOLq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=8MeCAAjqoQjcpJhOdd3gfYW0bCsqsmcy6NjW9utaaGM=; b=vvEcqygt5ckU2YckmJ6CJnHJXM
	zIiESDBLDtBqmShnQm9XLyoh4OcC59K5bDYKRT3B7/ZyL2cs3T9oa1+RC0fDxixxXwYSwkXH4XJyh
	+Se3lUL3PNpFbsFs12+mwZBY6toXTnjC1fVJQRP/HJykZ934yhMkvzvmt4H/yEzQHrYxtb8SjCdFe
	iNSeQgrMmkYfM1S5+zsGQu4CM3AIEtU4/3ZFEmNPB37uOdXJtrTHvKOe7lyW+ppPU9XFLiyu5LxZq
	vYOn8x+hd49giECPT97DlPGFhR8q8Tdnkdzwa1J33o3GUA6AJx1T9gRaUyYgeJ1bc1p5lTx8itp/e
	bNzqF7xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV4MC-00000000wUT-3Ai8;
	Sun, 22 Nov 2026 09:59:36 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV4M9-00000000wTm-3UVh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 09:59:35 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso17413725e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 01:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795341571; x=1795946371; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8MeCAAjqoQjcpJhOdd3gfYW0bCsqsmcy6NjW9utaaGM=;
        b=E9sPEOLqqBrue7CvrbwXIgPoaRXzERt8oSVjmu9HjFkIdv9/d1xS58QxxXL1Xvk7RS
         cFfey6huao25gPgtwMXqjtkV3FwCTSTUX/ElqX4GmQbIkEnGpLZzuihOCPH+mV5DqKsK
         ARsnGfgOUyfZfkMGU+rIwGPaQXb87nCAM8M68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795341571; x=1795946371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8MeCAAjqoQjcpJhOdd3gfYW0bCsqsmcy6NjW9utaaGM=;
        b=ecjEtaWv5TCM/e3s59WaoCudjWeiA/ko2NJOVgL1QQ2oBtPXLFadQaVA3gZ8fvxXb3
         RBeGq9liDaDsiRehU8szqpGWeQ5wNQqHQhf54GCXGDsysNKvqZe8ae9H0MS0olvNILoO
         qvJ0Zq9JowhsyOkJ7G3BcQ39tFDYyJLPBj4FQxu0US5AHLOWFvGkzTq3nIaLuychue06
         vzlV8NXW3xTDMJ253rcayFXBpAadSoGgOJDclKmVVti+o3yM70xhUAkTWjDCjqZ3Dqi/
         MyndSpPEPf4I3q21MGEj0azdWucjwSeNRWNx0k0taAbGzIGCvmMMgthtVjAt7uNzq/wA
         A19w==
X-Forwarded-Encrypted: i=1; AL+hErG9fZh3wE7J3BmHtxhOqAn39S5UauTWI04xT/0Xj8EMshHmBihWHef4kds519Th+xfZrKJjeOUf80eHgHxYgdro@lists.infradead.org
X-Gm-Message-State: APuU4Z9Tj7YukZs2U3ZNnD3Ro7q+k1EZvQAP9vD1vDT1mQlKz5cLP34N
	j/SN48mKHtfCvIUzQdI4VCB/4qdcz9DD4P3eRzomqBAKEfTe9wY0KmuHdyknks1eoZ0=
X-Gm-Gg: AZFdTZdKS+5nXHTn6Dma2iohu40+81tyYF+c8BT0+gcMMfjj7ik9K6FTO59t96M4Cqv
	Qbc/goBHhdNbT9cWde7ito+kgOxcfb9Mj0NIHkgSgO7aYZwsU2crPkNCzXTNCnnk7C9GxXzohdb
	qdCFSD/pufIH1oCBMahPPhp53qbyq0p9eHb84MiZAyhQR06KtGoRvU8RnLSSzkpXdRYrSZ+C79+
	5JV+jv7iiXOkyx93BtcylDLAejOmqLMQtkFRQyEZE8GodWn8i1OU+2t414t0W2D4ejLYye7rqP4
	nghMRglaIk1YCQDhvVyGLn1P0CRrjDUU/1wHr9vqgb3eJrFmz07cram3PAnDPx3ttExu1OLAD/A
	LIhWvh8jz3j83zMMzbOgD8Y+hf6F4uge7nwBD4K3Y1lBd/kZxk7A0IK2OhN9C6VK/3r8ORJIv9Q
	BTPtQAsNaNFRKhBZh6lwSayjkTVExSQf74PZ5CBeimCydELVPCPYMgvg+9dFJbheClTc9YG6g1O
	IO8+ZYCjTCj/efW+YgYLKLplcIlvPLHxsNZc8dyMu3WUrm9XEfMDwTX39K8feG/iWo5Pdhmm3ZT
	PfGCHOimJFAIj0DI1gd9oXSsiQLrJBP2CqbnE6/bzJh7V+grIvDlHo2ReRXlNdQZxq9E2bsA0nw
	XcTxwa0L9TjUfaEqHYmTuvBvh+pRil7Bk2yL+HqA5pspNI1vitq/cjA4A5ZFtvDf2Ov/LItZNQg
	vDZkj7YaHjXH/OO8hVg/JKiN8H6w==
X-Received: by 2002:a05:600c:45d4:b0:4a2:84c:52f3 with SMTP id 5b1f17b1804b1-4bb8880988cmr185327855e9.6.1795341571496;
        Sun, 22 Nov 2026 01:59:31 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm342455265e9.13.2026.11.22.01.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:59:30 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 0/4] pmdomain: imx: Keep the domains left on by the bootloader
Date: Sun, 22 Nov 2026 10:59:15 +0100
Message-ID: <20261122095927.2631909-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_015933_909749_DFBC52AA 
X-CRM114-Status: GOOD (  14.17  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The i.MX8M power domain drivers register all their domains as off.
A domain left on by the bootloader, e.g. to show a splash screen, is
then powered up again by its first consumer, which on the i.MX8MN
turns the display off and hangs the system.

This series reads the state of the domains from the hardware, so that
the ones left on are kept on until their consumers have probed.

The first patch fixes an error path of the blk-ctrl probe. The clocks
held by the last patch are released at sync_state, so they stay on
until all the consumers of the blk-ctrl have probed.

Tested on i.MX8MN (BSH SMM S2 PRO) and i.MX8MP (Engicam i.Core MX8M
Plus Fast Ethernet C.TOUCH 2.0).

Changes in v2:
- New patch
- Release the resources of the domains left on when the driver is
  removed
- Take the references once the probe can no longer be deferred
- Clear the boot-on state when the domain is powered off
- Release the references when the driver is removed
- Rebase on the changes of the previous patch

Dario Binacchi (4):
  pmdomain: imx8m-blk-ctrl: Remove the power notifier on probe failure
  pmdomain: imx: gpcv2: Keep the domains left on by the bootloader
  pmdomain: imx8m-blk-ctrl: Keep the domains left on by the bootloader
  pmdomain: imx8m-blk-ctrl: Hold boot-on domain clocks until sync_state

 drivers/pmdomain/imx/gpcv2.c          |  77 ++++++++++++++-
 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 132 +++++++++++++++++++++++++-
 2 files changed, 204 insertions(+), 5 deletions(-)

---
base-commit: d0f871bfb831705d9f55479f5b2b40f636ea7b16
branch: imx-pmdomain-boot-on-v2

-- 
2.43.0


