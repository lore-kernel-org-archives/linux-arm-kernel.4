Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F19C606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 14:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jxy4cy3N;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=riabenko.com header.i=@riabenko.com header.a=rsa-sha256 header.s=selector header.b=icLlwkPU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TR6OUDgv/AYeU+Y9kzpjd8XgXtxPnBaUiNmXSz3VrPY=; b=jxy4cy3NxohV+2pjDLF1zttpgX
	TzBfvTJbuDZZGQB/eS6ZPqM5zOEe/iWEsyKCtLUVXfRKLp9ey5V4GFgYgw85tKGymLLr8CnSpE+dx
	HNCTmXREbIFO7LK93BLOi4iLyQG0EQh/5Y8IZC+8wk737PmtOdIuRfd+4DGqRXzb+p6kHOFqugLhn
	alWuGRbLyPP3bWndnSOQX5NcvNpNYXTiEPGhviJwn5+ym6QvheOtf+RMAChn5hn9pp4eyFsmkh/Dz
	HkqJYZo7nstXAAn4QaGjYWDHMgW3N0EIp8goZaptbEih8B7NhzsXjUCa4VCX/g3arLLMynaY78KZQ
	iFRIGTXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsiG-0000000DGzy-1i5I;
	Fri, 13 Nov 2026 14:57:12 +0000
Received: from mini.riabenko.com ([2a01:d0:333:0:d250:99ff:fe83:4d25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsi8-0000000DGv5-1bcS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 14:57:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=riabenko.com; s=selector; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Unsubscribe-Post:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TR6OUDgv/AYeU+Y9kzpjd8XgXtxPnBaUiNmXSz3VrPY=; b=icLlwkPUEVsACSTmGciMV+obki
	vaaK24xmY7p5HvT8ILweO2EX6mSs/DlDAtr5F1ykk/eP2V8IBKjEsht/DQfkgf1CJUE1Rr5vN8XCO
	FiDfHgms1a105kspPxSbOIQxnF6kTquS/URON8FfOfrqy0ewPulQT6Cyr3wIauTqn4KznQiKdk63f
	TnSxAim314uTC428opxr0amlpQM1i2bxWVq7BIGpbyglVh4qo8xQ0guSJg7QlK3EXlF/uRrfUa7Se
	r6nao+MBL+IMm5G3w5waLoMEPfXn/tWh/wrVSrqLFDdByPzFTVLNKCpzflnLjmQpedSU+rjmjrz7v
	SbY+zsBQ==;
Received: from desk.lan ([2a01:d0:333::831])
	by mini.riabenko.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <roman@riabenko.com>)
	id 003MDt-000000003EU-1G8y;
	Fri, 13 Nov 2026 16:56:46 +0200
Message-ID: <5bbdc5d6cb97148a8c03724c0921a5a403eea762.camel@riabenko.com>
Subject: Re: [PATCH v2] arm64: dts: allwinner: a64: olinuxino: Fix phy-mode
From: Roman Riabenko <roman@riabenko.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	andre.przywara@arm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Fri, 13 Nov 2026 16:56:45 +0200
In-Reply-To: <b37fa1dd-862f-48ac-98c9-4556c2bf3f94@lunn.ch>
References: <20260822052353.22881-1-roman@riabenko.com>
	 <b37fa1dd-862f-48ac-98c9-4556c2bf3f94@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.0 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_065704_441969_BF5E7B21 
X-CRM114-Status: UNSURE (   8.05  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello.

I would like to follow up on this patch.

It received a Reviewed-by by Andrew Lunn on 22 August.

=D0=A3 =D1=81=D0=B1, 2026-08-22 =D1=83 16:53 +0200, Andrew Lunn =D0=BF=D0=
=B8=D1=88=D0=B5:
>=20
> Nice, thanks for doing a proper analysis.
>=20
> > Signed-off-by: Roman Riabenko <roman@riabenko.com>
>=20
> =C2=A0 Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>=20

I do not see the patch in the sunxi/dt-for-7.5 branch or other
branches. The state of the patch in the patchwork is archived.

I would like to clarify whether there is anything that needs to be
addressed to get the patch through.

Thank you.

Roman

