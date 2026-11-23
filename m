Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB798606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RwH0aclM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NQnLsAOF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DVuO288S4OHkKdmhORY1dPwKToeS5NVnqdlS1+sSYF8=; b=RwH0aclMH+j0I4
	uPtQoTqYk81VJCRyFTtTYXL75XEYxmlx9Q8c2RQEo8PlChaCMVKNz4M2N1aaYwDHkCGaI7FPI6WIx
	U9N8zQ0BFEonYYh+FQMcXxTGV9KoD4+QlDyLt7og2ddBWv0Ffg+g6sNeYb0qPvDy+u77NbqJ8x4tL
	/RUrQ3DAzZH4OeOlcc2Wn4HttsKj14EqFDIpCSzNsXAc1myKp9F4GJjpQvJBFI+RedP6fV3FYoqOx
	FhgI5wPcKc479jLyxwfEyuar8e34go0QnwrUla+/O2/HvXOCFgaXwKFP/EV8TNluYW6w//v78yxFd
	apyiIjS4O4PcdijZrlyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXKm-00000004GZg-18pp;
	Mon, 23 Nov 2026 16:56:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXKc-00000004GZ0-0Z65
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 16:55:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 61A9841E4E;
	Mon, 23 Nov 2026 16:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C58D1F000C0;
	Mon, 23 Nov 2026 16:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795452952;
	bh=DVuO288S4OHkKdmhORY1dPwKToeS5NVnqdlS1+sSYF8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=NQnLsAOF6LEkdxRgrWA+Y6Dd8hDOrVSQ28JC2tOvRkADqHKyOrdSs7yQ47vE55y3v
	 wR75XKuELYqRHeSnS5JvN1upBWMBTIFDySyNDdcPrc+825ElLNQtfMqq7UBVf9T5Ek
	 HE2volKb9SVQYRAAFxyMcxOmjieGVzbHnohAYMePuqzPaJgb+VsFmCMr3Jwbw6g1ER
	 Xv6aOijWTBdX6XEJXT5SacatXj1VBOhcIVXqkjt7r4b8RXBRIkSMGq9XMvppvkKjam
	 qs52kNGtnSkw5zU2lsuQlL3X8xZTYiAuenrf6u/YIu8gMwfL0RW2JofUMFiIqFm5S6
	 sDsugy0srrUUA==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 3/6] clk: cix: Preserve Sky1 AUDSS interrupt and
 reset context
From: Brian Masney <masneyb@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, robin.murphy@arm.com, 
 sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 tglx@kernel.org, devicetree@vger.kernel.org, 
 cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, joakim.zhang@cixtech.com, radu@rendec.net, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261120053529.371923-4-Jelly.Jia@cixtech.com>
References: <20261120053529.371923-1-Jelly.Jia@cixtech.com>
 <20261120053529.371923-4-Jelly.Jia@cixtech.com>
Date: Mon, 23 Nov 2026 11:55:36 -0500
Message-Id: <179545293652.209212.13817685318206713956.b4-review@b4>
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=624; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=dlN8f5waGDkpgx6y+Hr2A3mh8IFsF1SXgakq51pTHIs=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJZCnj0eiaWdbxJfHKr9OKuiLrVaT1LmUIiBU+uVVVJ7
 lFh+BjRUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwEQceBn+e0fsncxTtr3pT+rq
 2R9lmM35thsd23BggXjdq1SDnReOH2dk+FzskFH0sGj/R9NJzV9qLrb8X+chlzntd+9y04iMKuY
 SRgA=
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

> The AUDSS CRU saves its clock configuration before runtime suspend, but
> the save list does not include the AP interrupt gates or software reset
> state. If that state is lost across a CRU power transition, restoring
> the clocks alone does not restore the configuration of its consumers.
> 
> Add INFO_AP_IRQC and INFO_SW_RESETN to the existing save and restore
> list so the interrupt gate and reset configuration is preserved with
> the rest of the CRU context.
> 
> Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>

Reviewed-by: Brian Masney <masneyb@kernel.org>

-- 
Brian Masney <masneyb@kernel.org>

