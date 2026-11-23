Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A9C606A333
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 17:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hCOW2fwm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D/Nn6Wa2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ZYFw71kldd76QCwTZ1pURFS8nTenSTNKqbr9YucnS7g=; b=hCOW2fwm8/SJahc79MK6TC83Ir
	7FNTqI7wXQcPm+SwowkMRG1kqsuxtuoUi+srzvq1DSMMxuQOX8Ni61CRHz8UaQ+4mu6jf4PJaMut2
	Du+YVFJ+ELiHHKBDZDpd8SDxB/x5DEuPMhFmysAcs0E/gscUCmmr9GEM82D8NKs5DQw0Egq5p3YzH
	Gk55AvN0GKNDB/yBkLy90LqufN9wlljunM3ihFaBhkUDqlCgCK3lSjpgv6/88hj2jDqqRFgbBVGTF
	YvLAeW83tnEWLJRuSJnQ6cGMk81lC1ZAOKPNOBiA/9+LEEMXbuYght+aXbeC4cJWgarh2yUzbp72l
	DCbLEQKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXji-00000004L8G-3gOa;
	Mon, 23 Nov 2026 17:21:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXjg-00000004L7t-3VMZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 17:21:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4894343B21;
	Mon, 23 Nov 2026 17:21:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2F311F000EC;
	Mon, 23 Nov 2026 17:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795454508;
	bh=ZYFw71kldd76QCwTZ1pURFS8nTenSTNKqbr9YucnS7g=;
	h=From:To:Cc:Subject:Date;
	b=D/Nn6Wa2rIrY+rFe7e5OfAVwggkMCdiXLvP/gKvKJXNsVGzZQmYEyW6hlSUEi6Xn9
	 kUziZo18Hnj7REt0Qud+keOUi7HOtPwptft2p5f/UcGPQdFWm/iLn7vuam0Bk2zo7W
	 pYHT0ML2IuSxKG+HMt07z+NlnlTspnc9cCMxaTXeTPWAdqebtnzgVJEkvSRtw99zwc
	 UkzC1IxLJexDVUfQ9bqFIpUALJYxJM/MYB3wnLcRJHjWAyA1lp4uEAK9SpYGEsfozM
	 6IOAV1V0pBMmy2hg+N8BSZ5xZkzsIveo6qaZTB7dxyBXc9UHN+jhoc7YpsU+u/v+ZZ
	 BuzmuOuJNjDBQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Subject: [PATCH 00/10] remoteproc: Assorted bug fixes across remoteproc core and drivers
Date: Mon, 23 Nov 2026 17:20:44 +0000
Message-ID: <20261123172140.3547896-1-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, Fabio Estevam <festevam@gmail.com>, Mark Grosen <mgrosen@ti.com>, Hari Nagalla <hnagalla@ti.com>, "Rob Herring \(Arm\)" <robh@kernel.org>, Guzman Lugo <fernando.lugo@ti.com>, Uday Khare <udaykhare77@gmail.com>, Clement Leger <cleger@kalray.eu>, Oleksij Rempel <o.rempel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Ohad Ben-Cohen <ohad@wizery.com>, HyeongJun An <sammiee5311@gmail.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, linux-arm-msm@vger.kernel.org, De Leon <x0095078@ti.com>, Beleswar Padhi <b-padhi@ti.com>, linux-remoteproc@vger.kernel.org, Daniel Baluta <daniel.baluta@nxp.com>, Siddharth Gupta <sidgup@codeaurora.org>, linux-arm-kernel@lists.infradead.org, Hari Kanigeri <h-kanigeri2@ti.com>, Alex Elder <elder@kernel.org>, Robert Tivy <rtivy@ti.com>, Loic Pallardy <loic.pallardy@st.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Brian Swetland <swetland@google.com>, Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, Andrew Davis <afd@ti.com>, Tero Kristo <t-kristo@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rishabh Bhatnagar <rishabhb@codeaurora.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, =?UTF-8?q?Sjur=20Br=C3=A6ndeland?= <sjur.brandeland@stericsson.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

These issues were reported by Sashiko.

None of these changes have been tested on physical hardware.

Cc: "Rob Herring (Arm)" <robh@kernel.org>
Cc: "Sjur Brændeland" <sjur.brandeland@stericsson.com>
Cc: Alex Elder <elder@kernel.org>
Cc: Andrew Davis <afd@ti.com>
Cc: Beleswar Padhi <b-padhi@ti.com>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Brian Swetland <swetland@google.com>
Cc: Clement Leger <cleger@kalray.eu>
Cc: Daniel Baluta <daniel.baluta@nxp.com>
Cc: De Leon <x0095078@ti.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Guzman Lugo <fernando.lugo@ti.com>
Cc: Hari Kanigeri <h-kanigeri2@ti.com>
Cc: Hari Nagalla <hnagalla@ti.com>
Cc: HyeongJun An <sammiee5311@gmail.com>
Cc: imx@lists.linux.dev
Cc: Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-remoteproc@vger.kernel.org
Cc: Loic Pallardy <loic.pallardy@st.com>
Cc: Mark Grosen <mgrosen@ti.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc: Robert Tivy <rtivy@ti.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Siddharth Gupta <sidgup@codeaurora.org>
Cc: Suman Anna <s-anna@ti.com>
Cc: Tero Kristo <t-kristo@ti.com>
Cc: Uday Khare <udaykhare77@gmail.com>

Lee Jones (10):
  remoteproc: core: Fix integer overflow in rproc_check_carveout_da()
  remoteproc: k3: Fix integer overflow in k3_rproc_da_to_va()
  remoteproc: omap: Fix integer overflow in omap_rproc_da_to_va()
  remoteproc: elf_loader: Fix overflow in rproc_elf_load_segments()
  remoteproc: imx_rproc: Avoid stale mailbox pointers on request failure
  remoteproc: imx_rproc: Register SCU cleanup after resource acquisition
  remoteproc: qcom: Clear glink->node on allocation failure
  remoteproc: qcom: Skip unregistering uninitialised SSR subdevice
  remoteproc: imx_dsp_rproc: Fix pointer stride in
    imx_dsp_rproc_memset()
  remoteproc: imx_dsp_rproc: Fix off-by-one bitmask for trailing bytes

 drivers/remoteproc/imx_dsp_rproc.c         | 10 ++++---
 drivers/remoteproc/imx_rproc.c             | 33 ++++++++++++++--------
 drivers/remoteproc/omap_remoteproc.c       | 11 +++++---
 drivers/remoteproc/qcom_common.c           |  5 ++++
 drivers/remoteproc/remoteproc_core.c       |  7 ++---
 drivers/remoteproc/remoteproc_elf_loader.c |  6 ++--
 drivers/remoteproc/ti_k3_common.c          | 27 +++++++++++-------
 7 files changed, 61 insertions(+), 38 deletions(-)

-- 
2.56.1.750.gf70dc682cf-goog


