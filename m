Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A79F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 22:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nBVLFK0y;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l+CZocFO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MUGi+6yGnkd+Ifly32JGBty8CIYlhjDD8RBpprRWoYE=; b=nBVLFK0yetJD5B
	JaVZ82hWTxilWyHbZ4VahBFJuiPp1TSrjhrNqVOPm/UAFHNccgglbIzcozH19S+yRU4eIwMHAxBE7
	U/Xfz5TWPi3LQf0W2iWzq4CCTdQcndRzblhJ5JzkEQTuQXw49M9Ae+hRScopUZpdocRnRcpxNG1Jj
	5jRb9MesVvtW4bV3saY6afemsFOHDTdHlOWCU8we3pFSihkiyu1NkdektQvU+JyeLHFoogbJzHw3h
	6tjx1BoTIWPF9SoYRcnMKVKhRbfxmkOMum2rKeobx3bAiuv+8cc6OUESdr86SHdzWrr3qBvDxva5m
	TS1SxJKflq3gX/6Eml9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGXW-00000007uXQ-0pRT;
	Wed, 11 Nov 2026 22:11:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGXU-00000007uX7-1VM3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 22:11:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A33DA41424;
	Wed, 11 Nov 2026 22:11:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2B461F00A05;
	Wed, 11 Nov 2026 22:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794435090;
	bh=MUGi+6yGnkd+Ifly32JGBty8CIYlhjDD8RBpprRWoYE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=l+CZocFOipkssoSR4nDy8rXOPR4VscQyi4qnCL1vXPFwNQg8OaBOIuOCaInl8e96r
	 ZwlRc1i7/6L4/vzQN+0L0DwnuPbmtt67pfOjPY+vb0dxgPlPB90E7P0j1anEKLviQv
	 5LSrrdNHXhS/UOfzdhgQspSktdWd9/8F+qEEiPz38DK/XgFrpRqK9aYp87/QrAjErI
	 +jyYnf8ekRSoAZKyHF1Fbpjw6W39yy9fnq3WO2Y5eYee09N9qA/Vhq3yWy92aWaXID
	 32hmABD3dDPq1uccKqdLQN7VMxwxRDRnsHMjk9Ep7IHrJhQHw1C9tJr6BxPRHmK5Aw
	 R1QVhNtVNZuIA==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 2/5] clk: cix: Handle Sky1 AUDSS DMA interrupt gates
 as an irqchip
From: Brian Masney <masneyb@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, robin.murphy@arm.com, sboyd@kernel.org, 
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 devicetree@vger.kernel.org, Frank.Li@kernel.org, 
 cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, joakim.zhang@cixtech.com, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261106013520.1134450-3-Jelly.Jia@cixtech.com>
References: <20261106013520.1134450-1-Jelly.Jia@cixtech.com>
 <20261106013520.1134450-3-Jelly.Jia@cixtech.com>
Date: Wed, 11 Nov 2026 17:11:24 -0500
Message-Id: <179443508445.1143992.8301638068435530250.b4-review@b4>
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=1393; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=mfXkakMz9SQLnadusaEu+YqUiKYZPgdb6OV+3ZdFD4k=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK+vOD9uZVb4uv3nHldHjJmJjzhf5Q2x70WmpclWMz7W
 +QIq+bxjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACZiycTI8O5dXbIQ18kz2+d/
 VygRbQh/eI+l8Dr3DPbTzS/t9x94/ZWR4RNX2yHlgn8zhYU2lpdo71SbWh0lLsL4/8tpp88+Mdx
 +DAA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jelly,

> The AUDSS CRU INFO_AP_IRQC register gates each DMA-350 channel interrupt
> onto the shared AP GIC line. Manage these gates with an irqchip in the
> CRU driver, keeping access to CRU registers out of the DMA driver. Mask
> and unmask the corresponding AP gate through the IRQ core; this controls
> interrupt delivery, not AP/DSP channel ownership.
> 
> The register exposes gate state but no per-channel pending status. Poll
> each enabled child's DMA handler to check its channel-local status. Use
> level flow handling so disabled and oneshot-threaded interrupts remain
> masked, and mark the children as polled because IRQ_NONE is expected
> when a different channel caused the parent interrupt.
> 
> Use a raw regmap lock for the hard-IRQ callbacks and keep the CRU powered
> while its IRQ resources are in use or being torn down. Quiesce the parent
> IRQ before runtime suspend and move system sleep handling to noirq.
> Save and restore the interrupt gates and software reset state with the
> other CRU context. Dispose of child mappings before removing the domain.
> 
> Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>

The irqchip driver doesn't belong in the clk subsystem, and it needs to
go in the irqchip subsystem. You can use the auxilary device like what's
done for the reset driver today.

Brian

-- 
Brian Masney <masneyb@kernel.org>

