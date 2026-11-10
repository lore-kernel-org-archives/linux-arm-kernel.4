Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AD6606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 21:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2coJp9C6;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YMVAf3zz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Wihr2MrF2FO793dTKH7ddHpRfNQ9adLzPWYI0Gv/j84=; b=2coJp9C65WqI7Xoh5AGWqwaiU6
	yrb3g/Oe+fIW6Su2Bb3Yah/iuHxgACmKBi6HsBPgu64dAOeU6m7U64ESBdtPit8opZLtlk0KPR/NV
	PPCoOk9WvL16i4z+B/5l1t2Kks2kL8aW17A5URQ8GoK16qZvebgePdb+Fa+MOWD3vChljiQt4JHvH
	IYO3tyTLVVaqE3rdccdSVnSnYBjISRL725Uq/8B02RU5UaLFdjSyXt4/mkPuUijeEAzU6awL5F4m8
	OGMq1FQDU+blheVhvkR06q41MXgWug2sIWhLDJMHJhpWOT35kvTE3qSxNedxS5xRkiuqylrkU8G3t
	5X1H6ThA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQt5A-000000052JY-1Ysn;
	Tue, 10 Nov 2026 21:08:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQt59-000000052JS-0dgo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 21:08:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9641F61CF8;
	Tue, 10 Nov 2026 21:08:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE4EB1F0089F;
	Tue, 10 Nov 2026 21:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794344922;
	bh=Wihr2MrF2FO793dTKH7ddHpRfNQ9adLzPWYI0Gv/j84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YMVAf3zzQ0uqmVL+VbTBt+1JwkrNK+Qw1g08kq63UdwgwteUdVwp20F+rr1emd7Vt
	 IvMeVGLIbRV9oE6BEbzcDenCSC3DirWr9GhZJLjENk4g51cUp/DpJzRwygXyzFX6VW
	 1HNSZQaAbAU7dSw9W5Di8cYnz712D2Ae5jk0XTeOguq4TUxW6KnWHGSALSsypJEICZ
	 wtBaRKiKo1RI3Hmk4D8OXQDpRgdrOc9HJwOr+czsitqPSshhWE8TX0MWO5nVrl4RP1
	 SRy2vqLTkcGVCqwTjXDhahGcBbe9vg2BW03u2PtMbhRdo5N50kZW1Spftp6CcNWQbM
	 2gg5qJFmHgYqQ==
Date: Tue, 10 Nov 2026 13:08:40 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto/arm64: sm4 - Drop cpu feature table for PMULL
Message-ID: <20261110210840.GB1907@quark>
References: <20261109161052.890682-2-u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261109161052.890682-2-u.kleine-koenig@baylibre.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 09, 2026 at 05:10:52PM +0100, Uwe Kleine-König wrote:
> The result of having that table is that the sm4-ce-gcm module is
> autoloaded if the CPU supports the PMULL cpu feature. However that
> module is only usefull if there are both SM4 and PMULL. The module is
> already auto-loaded if the CPU has SM4 and calls sm4_ce_gcm_init() then
> which fails without PMULL.
> 
> So dropping the PMULL cpu feature table has the only affect that on
> machines with PMULL but without SM4 the useless module isn't loaded any
> more.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
> Hello,
> 
> PSA: I don't know what these cpu features are and what the sm4-ce-gcm
> module does. I just stumbled over that MODULE_DEVICE_TABLE(cpu, ...) and
> convinced myself by looking at the code about the above analysis. It
> wouldn't be a big surprise to me if I missed something relevant. So
> please apply some distrust before the patch.

I guess this and your other patch look fine, if Herbert wants to apply
them.  Note that we've actually been moving away from having separate
modules for the architecture-optimized crypto code, and when that
happens to this code the MODULE_DEVICE_TABLE will go away anyway.

- Eric

