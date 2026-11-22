Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32001606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 00:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z3mT66pR;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=dmKjF/nD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7721dtXy+uOqmJAcrPmJ693zdXv7T0kbGWyN960JshA=; b=z3mT66pRNZ7JBI
	wp1y97ToEDbdfw0TBSQWYVP2XvGW52LqdeNnmvulmJkARov92PGKaIQn/q5r62feEDc7ric0LcfoK
	myD8d57TI4tF4E40BrZ1PNaHIwnu6yi/Jn4ai0U2NtTDQkJOQj2LoNMJedCAWDPwFPa5zMQNWEGLn
	f59Q4U0hSGmGLC9FI5smmD7ZYh9fWMCZtxnARkfvlzfsLzAzjew0I8wkCpCT989RIJccunilAkVog
	ULPeaBPlGsz1Tk6jgG5GUlFRDx25I28QyoLPsVg4vt23rT75fjh1Z5mGYZfZdEGKa6k7qEMnvpY/s
	2ADCIU8n5Pa0G1UIF6tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUvav-00000000bUT-2x60;
	Sun, 22 Nov 2026 00:38:13 +0000
Received: from sender-op-o17.zoho.eu ([136.143.169.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUvas-00000000bTp-3Voh;
	Sun, 22 Nov 2026 00:38:12 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795307882; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=Xoz6J5k4tYYUi4YEY7jetL/jIJpIPUyROt2bfpoTFCS9sHBL6QgWu5a9yQOkL/XHr562updjmfBm1N9TCESXzJqsg7EQmWt3LcP7M0X67GK0UMuutS7lDXGSD2ob+e6DcBLcw6UHu+m8/UxE0uYu50ZxcejRgISnesx4XvSEbGM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1795307882; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7721dtXy+uOqmJAcrPmJ693zdXv7T0kbGWyN960JshA=; 
	b=FwkTp0kAI2KTbRyjxVjzfyRa1lMVN1/8wLq0erCfrW+FtrMyS3BOpq4fI+dtem85XXrkJ4WjQvXOY+ouKeVbUpjNWqlPh+6zcowZ1h/8XqGaV8QNYzGrDpMQWQgKp+0oS/tPBuKkBhIpMJ14NJDfmslAaIWE115U7WrbtwU1Q4Y=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=dmKjF/nDHJcEIgJiWQ/QomA2hvEKtXqknP/ruqOOpPo4gLbj2aowB+nYXtGKNFna/+Uat5XIpANWJRzAahk5ZDLtE3qTITqcnpmkqQf029Vn144CE5E/V1CM42SNVPDoZeWQNYCWmCdDI+jppZJkP6EZLFjHthzqeJdiUMQph08=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=7721dtXy+uOqmJAcrPmJ693zdXv7T0kbGWyN960JshA=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1795307880165583.4787051402167;
	Sun, 22 Nov 2026 01:38:00 +0100 (CET)
Date: Sun, 22 Nov 2026 02:37:58 +0200
From: Igor Velkov <iav@iav.lv>
To: Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Igor Paunovic <royalnet026@gmail.com>,
 Francesco Saverio Pavone <pavone.lawyer@gmail.com>,
 linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] media: rkvdec: Add VP9 support for VDPU381 variant
Message-ID: <20261122-rkvdec-vp9-vdpu381-regs-1@iav.lv>
In-Reply-To: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-3-180fb2d1f10c@gmail.com>
References: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com>
 <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-3-180fb2d1f10c@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_163811_183280_36938542 
X-CRM114-Status: GOOD (  10.33  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Jul 26, 2026 at 03:25:36PM -0500, Venkata Atchuta Bheemeswara
Sarma Darbha wrote:
> +		for (i = 0; i < ARRAY_SIZE(lf->ref_deltas); i++)
> +			regs->vp9_param.reg94.vp9_ref_deltas_lastframe |=
> +				(lf->ref_deltas[i] & 0x7f) << (7 * i);
> +
> +		for (i = 0; i < ARRAY_SIZE(lf->mode_deltas); i++)
> +			regs->vp9_param.reg75.vp9_mode_deltas_lastframe |=
> +				(lf->mode_deltas[i] & 0x7f) << (7 * i);

vp9_ctx->regs is allocated once in rkvdec_vp9_start() and
config_registers() does not clear it, so these two fields accumulate
the deltas of all previous inter frames: a stream that changes the loop
filter deltas gets the OR of the old and the new values.

The same goes for config_seg_registers(): the *_en bits and their values
are only written while the feature is enabled, so they stay set when a
later frame disables it. rkvdec-vp9.c has the same code there.

The VDPU381 H.264 and HEVC backends start config_registers() with
memset(regs, 0, sizeof(*regs)); the same here would cover both.

Found by reading the code; I have no RK3588 board to show it on a
stream.

Igor

