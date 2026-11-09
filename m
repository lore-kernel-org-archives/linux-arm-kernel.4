Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12570606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 02:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r7jBX+Fo;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=f7zVJPYL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TgSvuOCz1yzqmQTBxIlw5PsX+cc1UxOx06GfU8k+6sQ=; b=r7jBX+Fosb2WWkTAK+iEE0KCCL
	SjQJgUfkJYIl58ye0EMEbCqw9LBqY/Gkc/YBXPYbe9Q3JEhTkz8k2y+wWkpm85FBu/slmtornCJZA
	CromVqNvY32QwLnJnEVbmXrWa1R+aZLsFDFQRVEH5BpFhUzMwJdjKslN2nwjegLevRXHyoVfBFPjM
	pZrPbNJInL2r1NnNgmVEKQlMpldJZoVqsq31gHsfVhQYOjE2JmiGnjG9g001WsNBChwCPXcaiRAn8
	TGqxelLOtPpz0iY/oEas/OJQ0MfY9wUVMvEDLr/osJ0f+4ty37fhsqVXBDTkJGJoJ6Tf5OeynU50T
	3fRkvWiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQFSk-0000000H9od-2e3o;
	Mon, 09 Nov 2026 02:50:26 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQFSi-0000000H9o3-0HI1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 02:50:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1794192621;
	bh=TgSvuOCz1yzqmQTBxIlw5PsX+cc1UxOx06GfU8k+6sQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=f7zVJPYL6RCaoVmAll7Ub1ogTo3eKSo91d9qzir4wCFe8e4Ye1g/9UpaKwACHuoYl
	 faLkyRQsHCbqSMTu9v6M+WZXBt2j+Pq4jZdmAWjWlnwIZNArKa+3T6XKgAZp8GZIZ5
	 zgNuJsAglH3MH2k9jUtcXucof3VTa3H5bYDLBstZehQfZaDz9y5JMNKbXLMDmkR+NZ
	 MrZ6xPEHk3gCtIc/PCNG4RLTFcmPM943y7eRLeFTl8Xzwg8sBcCEbQNsPi6frLzOhE
	 xXcQx7JAWLUFTTy6h4aDXZcN2JXpoAQWtvj0dNTrgTchVZrSTxd9QzSTbDA+JP5o2A
	 r7UvTkQwu8prw==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1DE1064952;
	Mon,  9 Nov 2026 10:50:21 +0800 (AWST)
Message-ID: <14d76dd026f6d1077a6ac388a6a2d6136654c58e.camel@codeconstruct.com.au>
Subject: Re: [PATCH] pinctrl: aspeed: Use managed pinctrl registration
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>, 
	linusw@kernel.org
Cc: joel@jms.id.au, ryan_chen@aspeedtech.com, billy_tsai@aspeedtech.com, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 09 Nov 2026 13:20:20 +1030
In-Reply-To: <20261107012236.28069-1-prasanth.padarthi10@gmail.com>
References: <20261107012236.28069-1-prasanth.padarthi10@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_185024_321011_D7AF2FDC 
X-CRM114-Status: UNSURE (   6.46  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 2026-11-07 at 06:52 +0530, Prasanth Kumar Padarthi wrote:
> The shared Aspeed probe helper registers its controller with
> pinctrl_register(), but does not unregister it on device unbind.
> The registration can therefore outlive device-managed data.
>=20
> Use devm_pinctrl_register() to ensure the controller is unregistered
> during device teardown.
>=20
> Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

