Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F82E60A3822
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 05:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ropMyC79;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RlMcej0s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YnyI1E/tXADZNI0XTbGcSGGT3VaZrgmrn187FtfBb6I=; b=ropMyC793YTTyPMtAYQdpPMbU8
	6hCMdoKbiiddT2Vc6XUy56iIkDaiy9J80eTmzwhT7WmoWLLJa+3sbUTj+Dz1kvgNBQ0aFRFZPiZCE
	3tVoWBluxLQ4bM/PVI7C6t4iDj2lpK6LQAs38W9APR3ncC0TKnBY/MS8JE9upeCHNsCWZ4bD9f1uj
	fjrwXURoPTnYhUMD8UIi8xEsejr3A2GBsaXCAg/F61GZqVZmywdo3Fex7Zxptn6MRZeFKg65Zm9zu
	+pUSB6bn5N5S5lyOLiV70BkGSGvf+1WIkl5tgFm4MRSORBrnjIiTWQEvKXCY8o4phni+vr4iJXj++
	mIVS4zLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQenG-00000002a5C-3pPa;
	Tue, 10 Nov 2026 05:53:18 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQenD-00000002a3u-2vxD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 05:53:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1794289987;
	bh=YnyI1E/tXADZNI0XTbGcSGGT3VaZrgmrn187FtfBb6I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RlMcej0sH+YHRrPEV9YJUIDy+wr6QvgUvUSjUzl4ynFK/1A8o78bX9qhhf4hLaJBE
	 Cgvy6tJbLtFjESxgLDfQ5jUWGX9jCHJ7J99aQUIh2oDdIx9ZD40yjfvfqs584FmjMN
	 AO5kC+oLKBbDRMRfWNuLN3ER0TVOFagPaKoEAaNG7Gb6060YCs37/NL/sB6jvovceY
	 St82FWpxTZKZa9eOIBQWuhF5VmbeDPF+ycRnUkJaiyNVqvmK6DUak+/7QGwsJWCiFv
	 +WKdv8aHB3CcR/0EsGkGqEcxiX+udLc9ycwIKHIGblQlXb0O08pdPPuuWYBKBfM/rc
	 fIITpQN0q2Vlw==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C4AAC64C3C;
	Tue, 10 Nov 2026 13:53:05 +0800 (AWST)
Message-ID: <fff90721f7892c0285f4fed7fed460c7c1e183cb.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 2/3] ARM: dts: aspeed: Add Intel AVCRP BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Dawid Glazik <dawid.glazik@linux.intel.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	maciej.lawniczak@intel.com, Andrew Lunn <andrew@lunn.ch>
Date: Tue, 10 Nov 2026 16:23:05 +1030
In-Reply-To: <ee6958ba4b93cde4719fbac89c4027964c2236bc.1794242015.git.dawid.glazik@linux.intel.com>
References: <cover.1794242015.git.dawid.glazik@linux.intel.com>
	 <ee6958ba4b93cde4719fbac89c4027964c2236bc.1794242015.git.dawid.glazik@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_215316_229564_49CCDD88 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2026-11-09 at 18:41 +0100, Dawid Glazik wrote:
> AVCRP is an Intel x86 server platform equipped with an ASPEED
> AST2600 BMC. The BMC is used for out-of-band management, platform
> monitoring, and system control.

It's probably my fault to some degree for not providing a better
explanation of what I was after on v4, and for merging changes from
others in the past that were pretty lax on the description, but what I
was hoping for was something more like e.g:

- f28674fab34f ("ARM: dts: aspeed: Add NVIDIA MSX4 HPM"), or
- bc83b7353d2b ("ARM: dts: aspeed: Add Facebook Anacapa platform")

Are there more details you can provide? If there are, I'm fine if you
reply here with them, and if there are no further concerns I can update
the commit message while applying the patches.

This also applies to the JNCRP patch that follows.

Andrew

