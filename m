Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE4860A2605
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 20:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=creuBpvP;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IuFRFLLB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=U3dBz/jVADkkXLvlpKnunp0HEFmKspxrcSPqzBVm73U=; b=creuBpvPZKIuQW
	F2Sbdyt9x7LhCDL9cabw5CpMMOsqed87apq/BHTfBeXAkgi7vXQPZEg/88bWNluZ/9FLeXzomRFpe
	ZU084TA0i3ANg5a95Mu4AJD2QfO2+p4jpV5soT+bjkS7K0tR/BQ+ucn9NpXXD5Q2yJ+v4KL9BJWGr
	R8kIoLLWTqXgxvCZUDaIJruHYrEzWb5VEheY/s44b0Mc2vU8nzhul0CxdrG6xoZb0pFziWC/0V31U
	jfdtaD3O6eg2c3G9oVnjqn7fX/zdUvJVItf1LYAIhSAxWYHj4z0sf1DbAucz+GrLCxfRszHw4ThUw
	FumZtI/LUJGGs+V6iQlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWKD-00000001gxx-3CJZ;
	Mon, 09 Nov 2026 20:50:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWK3-00000001gtv-0caf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 20:50:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6406962C7E;
	Mon,  9 Nov 2026 20:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E361F008A1;
	Mon,  9 Nov 2026 20:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794257434;
	bh=U3dBz/jVADkkXLvlpKnunp0HEFmKspxrcSPqzBVm73U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=IuFRFLLBcJhl4fO8HFoYvnm+hiFuvQF5+RG82n/zznu/lt36a7tnep0pYzweJ4W3t
	 SF1qiQknWAWW2p5J5Z53YArpcCHZzLx3uUQMhTDHY1L79MSVGYmqAoO+T/0Sd34xfM
	 q/BoIqT7jrnUr5wVXPlqzU9PsdXP/hU1deHWLoRfJTFTx+7yJ3Gt+JoAX+MfTSUeTI
	 6LNSFE/i6IHMVNxD2wcnbyYUS1RWBMLWPe53/0nB/5/a/zj32iy/kEG9lX8YOMle7/
	 P2MAKF8lqeAJdmQHYP2xE+Jz/npOx8I4yKbf0ZMQrvaOEVBVOpG+bymI0brlF5Fxwt
	 FwGhCwUR6svCA==
From: Joshua Crofts <crofts@kernel.org>
Date: Mon, 09 Nov 2026 21:50:05 +0100
Subject: [PATCH 4/6] i2c: riic: remove redundant
 pm_runtime_dont_use_autosuspend() calls
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-i2c-remove-dont-use-autosuspend-v1-4-49a08b8daf36@kernel.org>
References: <20261109-i2c-remove-dont-use-autosuspend-v1-0-49a08b8daf36@kernel.org>
In-Reply-To: <20261109-i2c-remove-dont-use-autosuspend-v1-0-49a08b8daf36@kernel.org>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Joshua Crofts <crofts@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794257409; l=998;
 i=crofts@kernel.org; s=20261015; h=from:subject:message-id;
 bh=IVSers25eoM4DZzx6qxJHQbEMpXnYtK71Jw2toaHrq8=;
 b=t9pE3zY/+7WdfcULSx+Gk9C4x2Vls9kHzCAWOqg1ofU7Ri94Hoa8R1JslHm57Ld4gq4gfV+Ne
 IZ9yOf4qusGBun4WPDb1MluRTItABlkU+1xM5TS6H4Wh6yoC5w6rwrg
X-Developer-Key: i=crofts@kernel.org; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=
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

Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
driver core is now responsible for undoing any
pm_runtime_use_autosuspend() calls on driver exit.

Remove the redundant function calls.

Signed-off-by: Joshua Crofts <crofts@kernel.org>
---
 drivers/i2c/busses/i2c-riic.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 26b9d608fa28..57532dd2e3ea 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -591,7 +591,6 @@ static int riic_i2c_probe(struct platform_device *pdev)
 
 out:
 	pm_runtime_disable(dev);
-	pm_runtime_dont_use_autosuspend(dev);
 	return ret;
 }
 
@@ -608,7 +607,6 @@ static void riic_i2c_remove(struct platform_device *pdev)
 	}
 	i2c_del_adapter(&riic->adapter);
 	pm_runtime_disable(dev);
-	pm_runtime_dont_use_autosuspend(dev);
 }
 
 static const u8 riic_rz_a_regs[RIIC_REG_END] = {

-- 
2.56.0


