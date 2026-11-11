Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A41606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 01:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hLlHMbzD;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=POJCMNyn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=me/uMZLei5JIMqJLLPA+JNTv7cc5G55ohXwpfueBK1Y=; b=hLlHMbzDT1gTRDozAWd1zLHckf
	WrObKixU+uneso4CnCVWn+luqrBOlduug5yk1AYOhgPhApK88OocL7q0yGBWhQBXhV6bXVpoJn34X
	vgp3MKhb2wu/U0un9/UjUiHQfDPu+riT3CNBAwDxaQw0PaxIxIzHKvAFvDJpLo0uUK4uFW37iaWFp
	Yu5kg/vv3DJsDgSI+TtQ891/59Rfuw6HBJuP1OHOBz9VEYgjl2KX0kBs/cskVILntGxN60Gh7vhus
	pD7UIa7t4JHuLC2WY/qAg/dR98rs3WWtUWWqcAtqMz8SxspDJba2EcuG8Vevc6+GHIQFp8OwglvqF
	XQFbp+2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQx3d-00000005MyR-3Xzn;
	Wed, 11 Nov 2026 01:23:25 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQx3Z-00000005Mxx-2b8l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 01:23:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1794360199;
	bh=me/uMZLei5JIMqJLLPA+JNTv7cc5G55ohXwpfueBK1Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=POJCMNyn6snlb4G0e2HDTHoPRzRUBxoRk8jFatnDEtPv1p2ZhwYVCI5L5Vp9rcBwr
	 PkhiIN366ux6Ed1P4CIyu46MRmf7nbpmJjF9vEK1cAMwWyTYigfD6OnYaKyfb+uEuP
	 jdqWh1ZQmmwWM084HKuZUwuLmqzF6oDJKHFCTmA4erFENMjLjtZ1SRd1hkpvl36M/4
	 W4xI9Rh0DZSxbCFdMfUav/0Hof5XgXq7kXMRLCZCuQXgyUh+PJ2T3YCHXBCajW0/55
	 U3xHPNdpJBZJ8L3tBNv97CHR+DOZAPcy4587TXhp9dNrmq6+e9TRSrbfKVp3ie3oaa
	 U7G9f7qERxmiQ==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2B90D64C3C;
	Wed, 11 Nov 2026 09:23:19 +0800 (AWST)
Message-ID: <8b78ad45a331231c0dc0d6b459d2bfada521b6f0.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: anacapa: remove unused EEPROM
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Carl Lee <carl.lee@amd.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>,  Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai
 <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	colin.huang2@amd.com
Date: Wed, 11 Nov 2026 11:53:18 +1030
In-Reply-To: <20261110-arm-dts-aspeed-anacapa-remove-unused-eeprom-v1-1-e3b5d9cc1a03@amd.com>
References: <20261110-arm-dts-aspeed-anacapa-remove-unused-eeprom-v1-1-e3b5d9cc1a03@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_172321_847923_67F49612 
X-CRM114-Status: UNSURE (   8.06  )
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

Hi Carl,

On Tue, 2026-11-10 at 17:44 +0800, Carl Lee wrote:
> Remove the unused HPM board ID FRU EEPROM (0x51) from
> the I2C mux channel 4 device tree node.

This is evident from the patch so in my opinion can be removed.

>=20
> The EEPROM is no longer needed in the Anacapa device tree.

Can you please explain why that is in the commit message?

Thanks,

Andrew

