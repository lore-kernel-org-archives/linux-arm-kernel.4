Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C8460A2606
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=afQrNeff;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rs6YfbH2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=wkTqur1hikVaY6/qIWQOAtbgg5P47n0a+yvq7Tm9TfU=; b=afQrNeffMPvkJ+VLcH3RVIMyea
	mdBDJ9TIbM/A7VzmE2K8ABOQgk0Jf8pKBoaThqBPNo2raPxgpC/dfxqmulybgWLO8zuJFy7s8NiUB
	tQbMb1zwSSUcNAmFVUBqa/cndJc+rtAlz+YgkTONsCRt9w+2cirT5oUtem179sxzEcNckOU2Zq6GP
	bxpoHPGBiaofSwGPqJaUldxNm93MLarELsi87SIAkrwBB3mORB7TWmOjaPVGaVZDhEASoAcEF+QBK
	oHg8EbiQ1j/ynNZPZbST5BYefxhF70K4iwpzTa0p6hlVD5FJfLkkA8VQ5j8na+7iRr9Sn9F2SbC2O
	eGPxYO0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg0y-00000002laR-1SKs;
	Tue, 10 Nov 2026 07:11:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg0w-00000002lXV-0BG8;
	Tue, 10 Nov 2026 07:11:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 79EE563266;
	Tue, 10 Nov 2026 07:11:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794294689;
	b=NHuvs0u4qfH+tv70or5oCqNBA/lkLXRc95FArjD/54RO2Ghox4i8Yojr8y3msfyCVgny
	 3mbDffEQS2DE5Hj9ukQaN8wA7RN58PRQHWzJpp7jj/w5rbGnaJNhNbiSUJ8XXqNNMmQFE
	 qcnccA16zu2iGGRXVQwQRRZzJwfv6we2pPhyBqaommqIiklGMTWoGJvoLP5q4+nDShzcT
	 25LLczSc0EmtO+XWLjC9t3QUE5fBs50sZE+ElnDIPxgoWeAneHqJ0E25QBx3FdifTBWBD
	 x151rPEEkficDkkOXsSrW9Me5P7U7pfepWBCaTI6Ej/RcddXsAnjKchig8nwGWWWckw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794294689;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=wkTqur1hikVaY6/qIWQOAtbgg5P47n0a+yvq7Tm9TfU=;
	b=Ug4EvJofkw0QJTpV7mCzjk3a+TM/E7Klugh8ZtjnfDDHWGjD0hHLN5F7noTuT2ENmtQk
	 fIvi6+8wmkePE9jCTFt2T/kE8mGFnJwK8hFHqbKGUuv8eg9xDqouaFSBaINuTEM20xa02
	 jxO33lOEvySMyW5/axbKZMVblZWRI+Cy/K9yLe252cgjzOtTlfbKQPKexmwmDvVbzj/+x
	 JB1I0xqTDOo9S1JsyZ/90SeTMvtRekxORT4TmOsJBU4Flx90r46Ku/wlhEOwCKr/v6z9H
	 jLFtcyohIcr3vC3kZuXmeC/RGsN4e4woZJ3U4vsPuzSLeAXirgna8zXzUKakR11yaLw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7F82D1F0089F;
	Tue, 10 Nov 2026 07:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794294689;
	bh=wkTqur1hikVaY6/qIWQOAtbgg5P47n0a+yvq7Tm9TfU=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=Rs6YfbH28mNJq2cO1k+/CQvPZzQxP9XJyScvSPC/m78lOXVIJ+BcW8gAjmCyXR0mO
	 Dp9Se4McDraF0utY8Rk6AqBU8dNp3eF9SBxEiN7PTIrtun5GN8fmwIsSdVmfxptgzn
	 dhuHQzTyZ4pUv1O6q27FWYlQC1a8zE8zhGK5QcnxFLX4SUpQSPbzDx1w4A76KYN6no
	 hnLROI/Y5R3b3kDn6Xoic7YZNLC5g9GpvqMIZ9PzKCFy2/SAPAr5n8TrYn9gCvyiWT
	 kjsHC5SKy4jRabABByUybFPu4CfLFDRwnDK6lmcnnkQqKCHDRpbozUWBby5ba0MesK
	 +eCiqjkG6u5Yg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1357F4891E;
	Tue, 10 Nov 2026 07:11:28 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH 0/3] pmdomain: rockchip: fix the probe error and deferral
 paths
Date: Tue, 10 Nov 2026 07:11:27 +0000
Message-Id: <20261110-pmdomain-rockchip-v1-0-6b9fa6ebaa86@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw7CIBBA0V9pZl0SwAfRX2m6QBhkbHgE1JgQ/
 l2qy7O4t0HFQljhOjUo+KZKKQ6IeQLjdbwjIzsMksuzEIKzHGwKmiIryWzGU2aH40VpicpZd4L
 R5YKOPr/nsv5dX7cHmuc+gt6/gIeeoHUAAAA=
X-Change-ID: 20261110-pmdomain-rockchip-3497a2e7fdf5
To: Ulf Hansson <ulfh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Shawn Lin <shawn.lin@rock-chips.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Kevin Hilman <khilman@linaro.org>, Caesar Wang <wxt@rock-chips.com>, 
 Elaine Zhang <zhangqing@rock-chips.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Pecovnik <igor@armbian.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794294687; l=2416;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=QoAWdAEzgzL2QuwNz+wZsYoa/Z9SPuRCylTlgEE4RjA=;
 b=hCUZhEAiVVHPN/W3DReqR0LhracBQIiJ4fAnU+xZMyzjHjLbDahebbYCC/AKHaoQzU/BzHuRw
 ZlMANOkzg5rDQdFKewNmpFmG51NPTFrZVQtx0WuhpcE1gMJ81cTt/D8
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Three fixes for what happens when a Rockchip power domain clock is not
available yet and rockchip_pm_domain_probe() defers:

1. (Igor Pecovnik) Only the clocks that were obtained are put; the
   ERR_PTR() of the failing one triggered the WARN_ON_ONCE() in
   __clk_put(), and the deferral reason was not recorded.
2. The error cleanup removes the parent/child links before the domains.
   pm_genpd_remove() refuses a domain that is still a parent, and on
   RK3588 (RKVDEC0/1 are children of both VDEC and VDPU) no ordering
   avoids that, so devm freed domains that were still on gpd_list.
3. A deferral is no longer printed as an error by the callers, once
   per probe attempt and twice for a nested domain.

Tested on an Orange Pi 5 (RK3588S) with test device trees that give a
power domain a clock which only appears about 26 s into boot, once on
PD_NPU (a top level domain) and once on PD_FEC (nested under PD_VI,
after 18 domains and their links were registered). With the series,
devices_deferred shows "failed to get clk at index 5", there is no
"failed to remove domain", list or slab corruption report (booted with
page_poison=1 init_on_free=1), no "-517" error lines, and the controller
binds later with each of the 26 domains listed once in
pm_genpd_summary. A host-side model of the probe and cleanup on the
board's DTB, deferring at each domain in turn, leaves freed domains on
gpd_list at 24 of 26 failure points without patch 2 and at none with
it. Normal boots are unchanged.

This series was developed with Claude (Anthropic) as a coding assistant:
it wrote the code of patches 2 and 3 and the commit messages, and I
reviewed and tested every change as described above. Patch 1 is Igor's
change with a rewritten commit message.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Arun Iyengar (2):
      pmdomain: rockchip: remove subdomain links before the domains on error
      pmdomain: rockchip: do not report probe deferral of a domain as an error

Igor Pecovnik (1):
      pmdomain: rockchip: put only the clocks that were got on error

 drivers/pmdomain/rockchip/pm-domains.c | 73 +++++++++++++++++++++++++++++-----
 1 file changed, 62 insertions(+), 11 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261110-pmdomain-rockchip-3497a2e7fdf5

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



