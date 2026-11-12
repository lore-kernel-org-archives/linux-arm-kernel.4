Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62A5606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gs77Csl6;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lDVZN/xj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UwAE7JZbz6BZSDqMSG1PdFWp7D8tf1YwFLlJFvJVmaM=; b=gs77Csl6KTE0ClxmxJufumUqCW
	9xaJmGeokK8VFxUMyz1LpKtxuP2vc6FBcVxRw3L62DN3x0TBPolNAmQh6zRHURqX9bxc9r+cSuJoK
	Mdvhze0tTsIFajacRij/NXWQL1YjYcqAFplbcOUDAgNWwAJqHZ98nstveWmtFx1NDA1NG3DOBjZav
	sqWzMwHRzNDTaXYQxcFC7tvk6tCPovpnN2h6GsPaf4zBoCq2uQO/uu3adPFmcDbY/Zo5FAkvbIo80
	JfzsNDMzqmaNJ6doqD/fbOGdqiqRdqDPt0MCzMAtqACiKhXdEyRhTWwp3gXMP4pB7QQ8XXDDHIpGJ
	lP9TUuoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSfy-00000009cjW-2SKh;
	Thu, 12 Nov 2026 11:09:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSfw-00000009chA-1sAb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 11:09:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A05646122C;
	Thu, 12 Nov 2026 11:09:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927941F00A05;
	Thu, 12 Nov 2026 11:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794481743;
	bh=UwAE7JZbz6BZSDqMSG1PdFWp7D8tf1YwFLlJFvJVmaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lDVZN/xjnSgyoNZxykOUM3Smp2WGUkPhk9j7mDaN9E+JVptgcnjP2lOTs1wTllHiR
	 7T7ifFTHJ5Eb7Jnk6KjQdUwaMGLfQn+gdJBlXy7b87UL5fnHI77Bn93qfElLXl56hf
	 TRPklvFnuBF3h0B5me9Ipvfsjphlp0Nze5qbkSNFiii3uil+YcN6Gksl3jve+OiDv0
	 DAbNTNN16OR29/MWoYpahhudH1MXLyhXPBM6D3yfWPK38qBJPSPN7hcKpamwdgWbzT
	 jCy0J66OB5GcBXIVvBvMVmApo3apv9P/IUXCHZtuUbfsD3leaBH4U37jB+xowe4k3r
	 /LrWqjAM/OqGA==
Date: Thu, 12 Nov 2026 12:09:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	pierluigi.p@variscite.com, Stefano Radaelli <stefano.r@variscite.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Joseph Guo <qijian.guo@nxp.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	Josua Mayer <josua@solid-run.com>, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	Maud Spierings <maudspierings@gocontroll.com>, Mehmet Fide <mehmet.fide@screeningeagle.com>, 
	Markus Niebel <Markus.Niebel@ew.tq-group.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: fsl: Add Variscite
 VAR-SMARC-MX8M Plus
Message-ID: <20261112-vivacious-archetypal-kingfisher-edd054@quoll>
References: <cover.1794420001.git.stefano.r@variscite.com>
 <b8f4c61c0171ed19c8fb60b702e4fd2e2c9d7b95.1794420001.git.stefano.r@variscite.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b8f4c61c0171ed19c8fb60b702e4fd2e2c9d7b95.1794420001.git.stefano.r@variscite.com>
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

On Wed, Nov 11, 2026 at 09:23:10PM +0100, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
> 
> Add compatible strings for the Variscite VAR-SMARC-MX8M Plus module
> and its Echo development board.
> 
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
> v1->v2:
>  - No changes.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


