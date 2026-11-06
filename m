Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42443606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 15:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QAoBmhmy;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gg9Qwr4k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XvM4aLwTGZj5FmeeGnzfblv0DB1LtfcDNVzyNu2uS04=; b=QAoBmhmy4p3Cji
	VnQcRdWGrV51GaQtPJGp6O6YVnxABI3g91xwynELdI+BM8X68A5PRQM+ru95B5ka8dejWSpodQuLR
	2mwoTDyqSR17YsLCR+rbYRGjaNOktQ4BkqiPtbvGnT/rNSl5etvZ/bOJecPknx9TXv8Y4ArZglec9
	tiPFvoYqKM2DZP74wXxsW6vMtU1SaEJSNWvNOAVHGY3Vj/WYUeNTq1Qpzny1GlS+Y4/BvSBKIMzJJ
	YzoQVGW2g30IUKA95HSPNZOgvEpaBUTeHIOHSSxj/wg6X51JbJPmXgJGgeoB3/ln9hpp4xe6OrMxt
	WjekLznGpkoROpUjxcXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPME9-0000000CuD4-11wu;
	Fri, 06 Nov 2026 15:51:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPME3-0000000CuBE-0Yoz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 15:51:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7905660232;
	Fri,  6 Nov 2026 15:51:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34CAA1F008A2;
	Fri,  6 Nov 2026 15:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793980294;
	bh=XvM4aLwTGZj5FmeeGnzfblv0DB1LtfcDNVzyNu2uS04=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=Gg9Qwr4kbO9AYEeCkv1K0UKo/cQYAwHPADpue+nH3AF5qWLOUVKq1FLTpzmMo50vD
	 6zX6+wjFEwjVHNSD0lihrUxLXN/vzmWGUHs9aWLsm1FT+m25m35m5TYm1BHntIobIp
	 2LtMExaObn5ZvNFXYv+DmeUvmasP/VxNyLixNLPYx16Vp3EkJs0a15YpPvdrtxCNDS
	 soZHZdlkRSLDvMJpD6dEz8t70QU6AJXFsdVOw36r71g3zrQT88gEL5bE1ShZ+DvB/f
	 mOpyFMfNtjzetB+RsDbTR5BLXtxYkJ+m0pxADoNINR1ErWv7v9GaDGH/ZyIvZSbVxc
	 L2YS/0KQ3Zpcw==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 76971198003A;
	Fri,  6 Nov 2026 10:51:31 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Fri, 06 Nov 2026 10:51:31 -0500
X-ME-Sender: <xms:gfftapY6Upqe6PYvGFyUDwVT4AxOA7G-I4Wv5vbDj_AYY02iid2DTA>
    <xme:gfftarOJfIeWDuHsc1tZjFE8TrAK9J8xJDZ9KBwhvHLYODmpMuij6kdcqqc0MkZr0
    7ns0b9Y3wpeNBY_3yanaSvPBh5JflvoTZeOlVjbhHNj0qwJ1R9HLN41ig>
X-ME-Proxy-Cause: dmFkZTFO9KjBOddWujNCaW26YpnSt+HPt4zfErT3xj3FNF/1a9rqlMvuEU3djbNRlHCnSO
    j6CtxUPhdBxfm1x9PlRZCBJMaSeB/QVnMvLO3h6vjLjiABTb6G3oWXo/UMP02V2tyF9xSd
    ylwodMfptCLfjKCGtbWfnSRz1ccecmbvLtSi65X9SjZjgrwJD5n5NV8Gyi1ZasftjpmyvN
    dcbyOqogCBnuQWO+gKkGPJrxjvHerG2RYgmtL3oLXMx06xh5gVt9uVMDpOzw9Mx03spLtc
    wrsZcXTDPOmOkFPvLM0oEXQxnLmR2R90sbQ0Zbd76luMVvKbQAwT+GGBKMM0wWMN0GRHtY
    QCm41vfoF1hyeNG+ddEi+UcrooKkHGT56jtCZ9ePlC8nHjWLvAQ7DJSAyCMuemGZZWi3CZ
    sTQAfP+RSuXfJiQja4zrSJ7bbpz/GzQasNZ7I9GOMtAFmEHCjEh+90tZtM73n5C3mTxkIO
    PaUfPtxxDBzch/2PUqn+yh3YsgZAW2QQch6HhLc9bDbs7ii2ucY2IEzvFbrJA3+oJfa3vr
    GKp2+513hG4ikORb9aZdvlEh1lCBcOxqin3spbIZOR+3PdHCbghmWaxB2nsQLENSSnlRzz
    9EyV6FHND5H1JqR7NyFIj5lhT5t8hfAoe5ZXiEOj9SFzqKthVigoQcn7KtwQ
X-ME-Proxy: <xmx:g_ftanCRJ5kjiSpMUjqJxmnIEqP3Q0EewyGDG1e332OI1YbhUnAukA>
    <xmx:g_ftannsEEhk7ByYcfSbFgG6rvDjpI7PO-9cTsNcNxsO-zPmluskqw>
    <xmx:g_ftaifBD0UM1zdPFwkSntUxTiciY2zs00h36A58E-zTb2BcZG64JA>
    <xmx:g_ftarRCm__BadvffeAxf20m50iz-53X5jcv0DqFYc-xrPZ9fkQyCw>
    <xmx:g_ftapvchXwaiiRFqNdzftmtn5cJ8hoQuqcF1erc0UOZOxht8jxeeZK4>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 9F732F80096; Fri,  6 Nov 2026 10:51:29 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 16:51:09 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Jason Gunthorpe" <jgg@nvidia.com>, "Ard Biesheuvel" <ardb+git@google.com>
Cc: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Mark Rutland" <mark.rutland@arm.com>, "Will Deacon" <will@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>
Message-Id: <ee4d4788-3d59-48c9-b5d3-ab7d166f4267@app.fastmail.com>
In-Reply-To: <20261106143418.GC770409@nvidia.com>
References: <20261106141936.2744481-7-ardb+git@google.com>
 <20261106141936.2744481-11-ardb+git@google.com>
 <20261106143418.GC770409@nvidia.com>
Subject: Re: [PATCH 4/5] efi/arm64: Expose struct efi_image_info via the image header
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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



On Fri, 6 Nov 2026, at 15:34, Jason Gunthorpe wrote:
> On Fri, Nov 06, 2026 at 03:19:41PM +0100, Ard Biesheuvel wrote:
>> From: Ard Biesheuvel <ardb@kernel.org>
>> 
>> The zboot compressed kernel and the uncompressed Image both contain a
>> copy of the EFI stub, and both are tightly coupled to the kernel image.
>> 
>> However, the zboot stub is not linked into vmlinux like the ordinary EFI
>> stub is, and so it does not have direct access to its symbols. This is
>> needed today for things like image size and code size, but there are
>> more cases coming (DRTM) where both stubs need to have a consistent view
>> of these things.
>> 
>> So add a struct efi_image_info that is built into vmlinux and exposed
>> via the image header, so that zboot can access it easily.
>
> I tried hard to avoid doing this because I didn't want to make the
> struct layout ABI. I really see only negatives to that.
>
> Putting it here and documenting it in the rst is going to encourage
> other bootloaders to look inside it and try to read the contents. :(
>

Fair point.

> The linker trick to inject the offset into zboot seemed better because
> it completely prevents it from being ABI as nothing but the EFI stubs
> can ever locate it.
>
> Also, I wanted it to eventually be cross arch and I don't know if
> other arches have any spare space like this.
>

Yeah so let's bring back the code injection hack but only for the
offset of image info. 

What I would still like to avoid (compared to your proposal) are:
- having the efi_image_info pointer be a global that can be grabbed
from anywhere, even though in zboot, it only becomes valid after
the decompression has been performed;
- putting every shared variable in the linker script.

Please confirm whether those aspects look ok to you, and I'll respin
this quickly.


