Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645A8606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 07:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tRmIas9k;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BApg77rj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=RAv3jMi9jT0oBAikeI5ITIU2nYz68w41tRGXr1NGYec=; b=tRmIas9kiA6nsBImG+pCYfDaWv
	OLeAm+QATQOee7NH97xzE0qvUi3vRaUjIgLihzUJD+fKMghuOv+7bZnppP83BywTWi60gabRX+LH3
	cvWCIZpg+kA8wl+Q5kK8KIUNO5uYKOfS7P9U/nleKyOeyUf7ucjkn+MzEK2NGviraa3+hrqLWQA8U
	rmnY/DoKl6KaXaT+IedmYpBS192GUMIDYVfHhF7LrKY27pzHrAFQE772S6NO7Gp+hRrmgGFN+57Xf
	8UCJxvk5g2ekH++fwwMHHqMDaHkUc95V6gWGH0eUMsHqBlqAt9SrcnE2fPypalCtrLcIjduGAJ4J5
	AsoUN3VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOtG-00000002VK3-3Gt5;
	Mon, 23 Nov 2026 07:55:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOrf-00000002V43-3chs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 07:53:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 447D9422C1;
	Mon, 23 Nov 2026 07:53:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB9D1F000D2;
	Mon, 23 Nov 2026 07:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795420406;
	bh=RAv3jMi9jT0oBAikeI5ITIU2nYz68w41tRGXr1NGYec=;
	h=From:To:Cc:Subject:Date;
	b=BApg77rjizqtZBFefEroVa86MCmngRCuVmJZ9a1RIhjk4tw87FnxhegKaB9bg4PRi
	 y5pC2o0zJCrk7JHOD7k2lCHQAcIeIABa7vzKx8c0qqBIi/TzRMVfdqQOWwuU0hiCxp
	 gOLzGRjHEgE2WLqYv8LbkDokeQzSq36fmL17QKaZtVQ/QZofxDP2DyFiWgYO9ZJEZW
	 2POq2kOgtdh3g5gdfjQzbYMUKnrkngxCTh3C7PWcAEis9Ur47GXK9cZPcyBMz2JO7y
	 CwU73mjYHzQxeb5tmHk0o7pfW8yWz+9JbCFPKuiAOteWrlX5hKT/Je1/WAr4kNKQ4K
	 +icRjXbxKu3qw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Bresticker <abrestic@chromium.org>,
	Ezequiel Garcia <ezequiel.garcia@imgtec.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Grant Erickson <marathon96@gmail.com>,
	imx@lists.linux.dev,
	Joachim Eastwood <manabian@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Lokesh Vutla <lokeshvutla@ti.com>,
	Naidu Tellapati <naidu.tellapati@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	NeilBrown <neil@brown.name>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Philip, Avinash" <avinashphilip@ti.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sai Masarapu <Sai.Masarapu@imgtec.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawn.guo@linaro.org>,
	shenwei.wang@nxp.com,
	Thierry Reding <thierry.reding@gmail.com>,
	Vaibhav Bedia <vaibhav.bedia@ti.com>,
	Xiubo Li <Li.Xiubo@freescale.com>
Subject: [PATCH v2 0/5] pwm: Fix various bugs reported by Sashiko
Date: Mon, 23 Nov 2026 07:52:50 +0000
Message-ID: <20261123075320.379664-1-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

These issues were reported by Sashiko.

None of these changes have been tested on physical hardware.

v1 => v2:
 - Drop tegra (superseded by 9ad5602d4943) and loongson / axi-pwmgen
   (already applied)
 - mxs: Check pwm->state.enabled directly instead of calling the
   consumer helper pwm_is_enabled() (Uwe)
 - fsl-ftm: Move ipg_clk enablement after the channel loop and document
   why it is needed around regcache_sync() (Uwe)
 - omap-dmtimer: Propagate negative get_pwm_status() error codes out of
   pwm_omap_dmtimer_apply() (Uwe)
 - tiehrpwm: Clarify runtime PM state before pm_runtime_enable() in the
   commit description and match teardown ordering in ehrpwm_pwm_remove()
   (Uwe)
 - img: Clear autosuspend in img_pwm_remove() and document why driver
   data remains valid for runtime PM callbacks after pwmchip_remove()
   (Uwe)

v1: https://lore.kernel.org/all/20261105143847.2559586-1-lee@kernel.org/

Cc: Andrew Bresticker <abrestic@chromium.org>
Cc: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Grant Erickson <marathon96@gmail.com>
Cc: imx@lists.linux.dev
Cc: Joachim Eastwood <manabian@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-pwm@vger.kernel.org
Cc: Lokesh Vutla <lokeshvutla@ti.com>
Cc: Naidu Tellapati <naidu.tellapati@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: NeilBrown <neil@brown.name>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: "Philip, Avinash" <avinashphilip@ti.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Sai Masarapu <Sai.Masarapu@imgtec.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: shenwei.wang@nxp.com
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Uwe Kleine-König <ukleinek@kernel.org>
Cc: Vaibhav Bedia <vaibhav.bedia@ti.com>
Cc: Xiubo Li <Li.Xiubo@freescale.com>

Lee Jones (5):
  pwm: mxs: Return early when disabling and fix error-path clock leak
  pwm: fsl-ftm: Enable ipg_clk around regcache_sync() during resume
  pwm: omap-dmtimer: Propagate get_pwm_status() errors in apply()
  pwm: tiehrpwm: Enable runtime PM before registering PWM chip
  pwm: img: Unregister PWM chip before disabling runtime PM and clocks

 drivers/pwm/pwm-fsl-ftm.c      | 12 ++++++++
 drivers/pwm/pwm-img.c          |  9 +++---
 drivers/pwm/pwm-mxs.c          | 34 +++++++++++----------
 drivers/pwm/pwm-omap-dmtimer.c | 54 +++++++++++++++++++++++++---------
 drivers/pwm/pwm-tiehrpwm.c     | 19 ++++++------
 5 files changed, 86 insertions(+), 42 deletions(-)

-- 
2.56.1.750.gf70dc682cf-goog


