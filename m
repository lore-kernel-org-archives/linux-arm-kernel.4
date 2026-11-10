Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB4060A5BE3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 14:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f3qgkmGi;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fDsH2EnX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=POoseU5QwHuTaUUqTtUaCKWgFktdvvSiU7J4FyrRut8=; b=f3qgkmGiGDotipLue1KBYJa3/S
	hnLYlnWehPhCWwr1DQKCQseLyJ856vGShwhVJcPgSpdXiMWLY2GUjKJOr38gKES5VS8HHPCDUp0d0
	JgQChk7BPJpoQkLWm+DLQPoPKDsObSs99HAl1/IX2mPct7LFdf47LFQ9M86Qz0/nejKjAIQaCyU8o
	9nvH1ZrUluI9pF3e+ec18u+JFv3W+l3NAIzmUhFlyxVoRKXddyfLMf/uSO7h+VuEU4T4oeNkF71Uk
	+4KJMufyuounew1QjesxPwKskeJtkfk6/1uJy4CBkQZufnOQCOgczPu1HNh7em3muU84nufUos/bb
	C90Ndqpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQmhO-00000004Aff-3qng;
	Tue, 10 Nov 2026 14:19:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQmhN-00000004Adu-1g0J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 14:19:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DCE8A401C7;
	Tue, 10 Nov 2026 14:19:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1E481F008A1;
	Tue, 10 Nov 2026 14:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794320384;
	bh=POoseU5QwHuTaUUqTtUaCKWgFktdvvSiU7J4FyrRut8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fDsH2EnXolC6lBYjERa8+hrs1OrXDOSShrHiB+D5vBvoOB+AmgDD7+mim8cvKWcNA
	 P6FgjtHvNXdz94wvEwC7NmaRIqO9GF2L2EY/FyN1xYiUWoc+xElEwJ/Rz4CwYcGs60
	 oqcqT4onDDt4km7S3u7oUc4+j5eLWjyXJ7wF7kmVfJ4BQHhgJ/1/Uzo3OPkFRX4y82
	 HhgI46xJX924YQhRzwrbBtcrFiybbUwONnsO9jYz77F8/RNV0ngWY6Bg+ZA5f+E3O8
	 CBghcxfkhqxr3u1DK77peWiRAaYph38WxyserAtZBNTNOZRRskHbOaWAAsggrsgIJu
	 dT/j4gTYagZwQ==
Date: Tue, 10 Nov 2026 14:19:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-hardening@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Ard Biesheuvel <ardb+git@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Jann Horn <jannh@google.com>, Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>, Kees Cook <kees@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Maxwell Bland <mbland@motorola.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	=?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi@google.com>,
	Quentin Perret <qperret@google.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	x86@kernel.org, Ira Weiny <iweiny@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH RFC v10 04/22] arm64: Implement asm/kpkeys.h using POE
Message-ID: <07b55bf9-e116-4731-9f84-49cd1b55fa50@sirena.org.uk>
References: <20261109-kpkeys-v10-0-aa6c4d9603bc@arm.com>
 <20261109-kpkeys-v10-4-aa6c4d9603bc@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gYHulBH5cftCD4rh"
Content-Disposition: inline
In-Reply-To: <20261109-kpkeys-v10-4-aa6c4d9603bc@arm.com>
X-Cookie: You can't take damsel here now.
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--gYHulBH5cftCD4rh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 09, 2026 at 03:58:29PM +0000, Kevin Brodsky wrote:

> +#define POR_EL1_INIT	POR_ELx_PERM_PREP(0, POE_RWX)
> +
> +#ifndef __ASSEMBLY__

Everything else in arch/arm64 was converted to __ASSEMBLER__.

--gYHulBH5cftCD4rh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrzJ/YACgkQJNaLcl1U
h9DrHgf+Ntv2EG47dQBJVo2dflFo9Lt9TsvYKLCqzm33JoYC/P26mYi/8633hQW0
w2L056Uutdlq/ierGicH8Fb1zQIA88/FnTKEh+j872XE9Kz4ZNVl6MpVbWxm5oq+
FFU/2s66n/vbRZUIEfoM1X2ux5jjIHqdDWq4BeaMI0BS5ZpXXqVxkf+xsiESskAa
GCqvb4bLfjyFI005vGSvrjzju9Wd99csPXt8fcqRlDlXZOAPkJC9lwEdFNCxkMcg
LxBzbT062ehMLTyTGLIvAxVbakdWlTWbp6CglbDCrddaKZz1/9gRQ0w6yMYej1vM
O4DSvBecyFNT6MVKzNIRtQqL3QrIRA==
=esSa
-----END PGP SIGNATURE-----

--gYHulBH5cftCD4rh--

