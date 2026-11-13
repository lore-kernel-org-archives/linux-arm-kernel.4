Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BF4606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jqT7rG+f;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kZCFIgb+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uws9udfa5adxCOqS10/CzLqccmroeJZWnY6ioU46GUA=; b=jqT7rG+fMnEhe/
	4/ysYg/9wM1rX/HpZCCRbOx8pmrgcpPea47nBqkZfBeIms3sDmqTldnQ+DCKnywBLWrjCl2WT9pre
	IxxJ1b4tOC631broGzTyAcgD42sOfb3XCiogMzsPR3f3PNKBoZmSI0/p1FX+szFq9Pi+EJbD5NQiN
	KKeI9nnDbrsJ2swAe7foLo1yOXmnIi2KZEdVYUC6VQjlmpfVInmWVwV51YoZz9NC2LnoUiaahrCni
	j3sJSR+xHUCaWf5CZ+UxZze06FMCjxkIYJtVWPUQvn7DkfK6o4Cul2l4lQSkL9pqBTyhxPjuSpu0k
	AjdUsgWnBGAVJIbqAkXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmZh-0000000C1Px-0FdU;
	Fri, 13 Nov 2026 08:23:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmZE-0000000C17t-2I0f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 08:23:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F06D61908
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 08:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89091F000C8;
	Fri, 13 Nov 2026 08:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794558207;
	bh=uws9udfa5adxCOqS10/CzLqccmroeJZWnY6ioU46GUA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=kZCFIgb+C+M14fT8GT+7w3lwKw0U62zWbhKxjM6HW4sHlZnK5OK5zCkoKqSXI4V0/
	 ps7XCr94u85konlRQiMJhYKUk0axeMWUh0rA994mEycZy81dLHItRqPv7VF9qGliau
	 Hiq2LyWF5qzyafVScoigIfa9miJUocEvZVVGp/rwfRvYiCldlqEAAWQCe4cEYtl7/W
	 JPaWtgGshzCmfk4F9aBGE/dxN0PNXqRZvCIkfLN5PEJq+2FXQrDZawV2SZEpCJWZmc
	 T15/4kdB/r70CqQJ45u8tU1RtNq+W9m1tVQrqIcu5UitCUxAt+tsPrqaWW9I9/kxEj
	 D7IT9mxF8Iz+g==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 2D6F2198003A;
	Fri, 13 Nov 2026 03:23:25 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Fri, 13 Nov 2026 03:23:25 -0500
X-ME-Sender: <xms:-8j2aqx0alojUggD-TyY75cRCW6wyvsIQvCpWBQSaCyeiKJwU-HZ5w>
    <xme:-8j2ahEJRba2QXRnkRRo0oqwDkBzv7fsjq9BseCS1_ijQENTnJq0f5lvGknzsG324
    jTBKfxuUDWte8cNhcKxxK5BbYsZ7T3vc1LdR2rtd3Nj7tLuRz4PjDo4>
X-ME-Proxy-Cause: dmFkZTFasi1mk7Wg6vwiVKBf/OywSreu1wv+JOwFPo8fJdW3GoQxx5JHsrogrVfeHcW4fQ
    lbCN8q3fdN41dpXnltUWEHmAIxBL/mWTVMNLDmGIKgODLU0PJo4SJXr9AGRY1EcOSsiaCF
    WqB/B1tAYOmeuwlIgFvtcJups27WiWKapW37JCs29lSLVBohtT2zLz+lgFOzcxEMU+FZtQ
    MWZSK4exr8gaYB68OnDPYfOHqOPhsCw/Q56xm2R/9ddSWMseN+st7tEafzy7qU2Rz8SsCU
    X/nJi+NABMr/qQ3I3zkRoNbr9qFHTF2Xy/CjmekLgicnmKWy/BqQMEIfPvaNCGt5HjE5lU
    LwJGyENElv+V32Ts05WL2akjmcx4R/W8d+Jvo4ti5Qw+txJAjHq6wm20brYjPp7oFJS1va
    jInambHAZ2Es0tvRn+NAxGzZ56vPkTnjG6ValS7tWmmVuQYfZy4XuBlcxHA5DYi6fjVu5P
    5PT0YQR34s29UfyPIh7Xo+Ywi6N5l489uDwea5qOc/ejptHZ1vMl+0LCUvqXl5jYzf8teh
    AynXG3v+PPeZD5OdGCmXXr37QFkEbYvbMRzQkSaOe6J3Y39nbVFz+Solb3c5TSkVDSexwe
    qEuwVB7B7h8P40otg+41ox1u+uytosN+Gg8MN1QZSymrIWJ9yLh5FiXH6D2g
X-ME-Proxy: <xmx:_cj2anXLN24syy5Z6karfe5hKha3M4js-XdnyZWEyFmcamsH4T8Otw>
    <xmx:_cj2ah3DNhO7OEGSp47D3kp9-E2_nMcMuHNnopX6ylXrquPWcqfYfQ>
    <xmx:_cj2alr9nFGKCbn3Yr9qU1mEJFX6xe9POEdDloRKezHv-5CxWkkrtw>
    <xmx:_cj2aoUpHvU5r-yC6r5VcdROsO0kYy65ZhGXEabAQ3ZQcLN1q_sm2A>
    <xmx:_cj2agYAdlspQa2uUlC0LcCHFnpKcoGJ_3nYgUsW5aNynf8GjIxpei87>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id C3DD0F8008E; Fri, 13 Nov 2026 03:23:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: A5RLEaK5Drvc
Date: Fri, 13 Nov 2026 09:23:03 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Nathan Chancellor" <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, "Christoph Hellwig" <hch@lst.de>,
 "Eric Biggers" <ebiggers@kernel.org>
Message-Id: <bc58b973-3d54-4480-aaaa-f5d5269418ea@app.fastmail.com>
In-Reply-To: <20261112222720.GA188816@ax162>
References: <20261029135020.272082-6-ardb+git@google.com>
 <20261112222720.GA188816@ax162>
Subject: Re: [PATCH 0/4] Get rid of all NEON intrinsics stdint.h type hacks
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


On Thu, 12 Nov 2026, at 23:27, Nathan Chancellor wrote:
> Hi Ard,
>
> On Thu, Oct 29, 2026 at 02:50:20PM +0100, Ard Biesheuvel wrote:
>> From: Ard Biesheuvel <ardb@kernel.org>
>> 
>> Recent Clang has become more finicky when it comes to overriding the
>> type macros that the freestanding stdint.h consumes when defining the
>> uintXX_t types, and so it is time to finally get rid of this entirely.
>> 
>> So instead of making stdint.h (which comes from the compiler when
>> -ffreestanding is set on the command line) agree with the kernel's
>> linux/types.h header, avoid the latter entirely in the compilation units
>> that actually use the NEON intrinsics (which are always leaf functions
>> that are not tightly coupled to kernel APIs).
>> 
>> Note that the disagreements are about long vs. long long on arm64, and
>> long vs. int on 32-bit ARM, so never about types that actually have
>> conflicting representations.
>> 
>> Cc: Christoph Hellwig <hch@lst.de>
>> Cc: Eric Biggers <ebiggers@kernel.org>
>> Cc: Nathan Chancellor <nathan@kernel.org>
>> 
>> Ard Biesheuvel (4):
>>   lib/crc: Don't include <linux/types.h> in NEON intrinsics code
>>   xor: arm/arm64: Move NEON xor_gen() dispatch into the glue code
>>   arm64: Drop stdint.h type overrides from asm/neon-intrinsics.h
>>   ARM: Drop stdint.h type overrides from asm/neon-intrinsics.h
>
> Who do you think should take this series? It would be nice if it could
> start making its way to mainline sooner rather than later since tip of
> tree clang builds have been broken for over a month at this point.
>

Are the first two patches sufficient for that? Perhaps Eric can take them
through the CRC or libcrypto trees, and I can send the remaining ones
through the respective arch trees the following cycle.


