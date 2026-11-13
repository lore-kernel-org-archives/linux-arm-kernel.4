Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF149606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 21:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jT4pPwO2;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M4xpMlSz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dyCoPsA0aOvLJXWHgDENXQwMLfq1W+de7nvoNnEl1II=; b=jT4pPwO28AUib/
	FAz9RLbSF9xz3PjoU0/Ypahumplp56EmaXVbzY8n7twr6P80n4O+PVW4L9KOq3OwSB0CbL8UCsyQS
	SLsttfB4yqkTjD3VhO30OAY9ljfvSDcqcKfUyi+Bv5QGgPLYYslGx5pm8CNtm+IOkMjpT8EU+AY8j
	12r921lDM6qOSzXZc5yeskcfCc5GUJaBHFmIbq0+6t+EraCOOz4nYfuukoZuD8gM2kP7BdjyRFDbA
	ZnAEEOtdososFIGQr/lPWQiVEvc4QIdpG6Kcm8rkUCQnrsRwYKxiX4JADijoDGwSgCbyWWXRKxOe+
	PO/M7/ZmZpAmoNViWYMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRz7N-0000000Ecgc-24jJ;
	Fri, 13 Nov 2026 21:47:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRz7L-0000000Ecg3-30LF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 21:47:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0986741FE5
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 21:47:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 702A71F000CB;
	Fri, 13 Nov 2026 21:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794606450;
	bh=dyCoPsA0aOvLJXWHgDENXQwMLfq1W+de7nvoNnEl1II=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=M4xpMlSzgtN1gl+LY+LdBB4tYi9a6KJfWiukiNA0a4aGgtPtBYa5ZuZu7pBjwC/G3
	 hT7HN3c364kasIqlRRTzSzn4XKJwP9YlK5+TicjdzVQHMAXNJUR5uOYGvf1fw3+mjY
	 E8U7XroSDb0EXtcKNB8lrckuN8Oed/gzokM2zPDXEpQHAmf/AxVdwrW35lZwMqQ7Aq
	 IyLfPnTNURAot35eWJowEbodgOukMKrjPRWbqQU8M15E6guhiitXOloZJA3y/eqTbC
	 N/4JvfE5hZQ4V7ko1QMonvwxZXaKfHB6LXiDw6Q2XHNxaYBlmL61JmGG3lzHsvEpAI
	 2elrPQAo3DFWA==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 7B766198003A;
	Fri, 13 Nov 2026 16:47:28 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Fri, 13 Nov 2026 16:47:28 -0500
X-ME-Sender: <xms:boX3as7Xa1vd_C9l0vVk2S1n6okh9_45h98mF9Wbn-tUZyYQlMZhOQ>
    <xme:boX3aovKRELz2ZRAALb3yQBmO1EWCacRIdFc07DlIGWUhGIcZAUrbqQggvnotgCKs
    naTlEBsv4XZnZu61C3ZdpZPVAE6dWXm7vtQBATrYw5jRfZAFzN_eHm2Aw>
X-ME-Proxy-Cause: dmFkZTGn9lrskfsW1+KbF6ZUS6NkVQFTi6onuN4cCIouK54mbrZXCz6ufIVLN1gsoPBIEw
    0RFP+B6M2pDlmqKmu6sBndWXJi2T3Hgu27A/8xAjhQkjUXOHB647a/OUIL3C3Sf0AhAp9j
    au4hmQbGK7SR9ukusDshTV9UBw7bg/H+VzFyMHGJjvKwq8pW10PQTH7Qbkrg7uorMRBavh
    M+aeCb7QBysFip3jMt7w+4pNdXhynAQ+ayS8LOi57/U4WxbQFESC3vM/rVA/5UgvT08jWb
    jsGxSCsJGmjeAPXk/C34f5qMtmCOWtO1+HWQtUwcWcTyzXRDZefimuQfEMllQ8BfWt38je
    CLKQDEldFgV+B7AK9UBrQ9V8gZfnz7gW4+svkE9YuPVnTsxLa+PZBqImnqgJH+6YQtM1ir
    OtulGULT0p4AaviB3K4pFy/+lopvEK1YIpMqHeX2vhXVFvNnEDApXmv2AgHiPzivyEBrGB
    s4hBAIVC5AnV9li/f3fbZYJ/uYvwhelHveNVk/AU4OOdt3HnWnL4FT3/YHXhyK/gZBXJWz
    RIi6l0+qbtbTxZMy7g0JyoN4fHYQpxWvE3TzGndxS1nasW9f8bDmCqB5gkvHD8MgFvd//s
    5vbWtaSTNKKIH5LG8wxj8Y5M3JB6hu1vjXUtm69jzmFBXcn/lnZLlKU80aKA
X-ME-Proxy: <xmx:cIX3ah-3xPlXF68y2C1WHKlnjV3DAljzi3bu2s3AS09jXSzN98JtsA>
    <xmx:cIX3akzNRFbDpo62wYqIOq_Ym6qorqrm1ZYoU2uHq4gefIK2w_T4zQ>
    <xmx:cIX3alNvWkkCtq9XFFAMQJBZA80NujBNEZBAtcT3niCsxAWADW8-sQ>
    <xmx:cIX3ah8W84qwh5HHIaVUZ4jjewlY78sgnJB5GDYS9VHvP42XDJGavg>
    <xmx:cIX3aq7TMv6ITrAfE_XnT744kil1uWbsr0uZem-l8mZeHJvc9irFnYJF>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 864FBF8008E; Fri, 13 Nov 2026 16:47:26 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: A5RLEaK5Drvc
Date: Fri, 13 Nov 2026 22:47:06 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Eric Biggers" <ebiggers@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>
Cc: "Nathan Chancellor" <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 "Christoph Hellwig" <hch@lst.de>
Message-Id: <289380e8-9bdd-4769-b62e-dbedb553a16e@app.fastmail.com>
In-Reply-To: <20261113203007.GB29151@quark>
References: <20261029135020.272082-6-ardb+git@google.com>
 <20261112222720.GA188816@ax162>
 <bc58b973-3d54-4480-aaaa-f5d5269418ea@app.fastmail.com>
 <20261113190150.GA2857474@ax162>
 <b7f72b97-6e8e-4b07-a2a1-6ac8c6e596e4@app.fastmail.com>
 <20261113203007.GB29151@quark>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

cc Catalin for real this time.

TL;DR Clang builds are broken due to type override hacks that we
don't actually need.

Please consider these for the arm64 tree, preferably as fixes.

On Fri, 13 Nov 2026, at 21:30, Eric Biggers wrote:
> On Fri, Nov 13, 2026 at 09:05:32PM +0100, Ard Biesheuvel wrote:
>> (cc Catalin)
>> 
>> Full thread:
>> https://lore.kernel.org/all/20261029135020.272082-6-ardb+git@google.com/
>> 
>> On Fri, 13 Nov 2026, at 20:01, Nathan Chancellor wrote:
>> > On Fri, Nov 13, 2026 at 09:23:03AM +0100, Ard Biesheuvel wrote:
>> >> On Thu, 12 Nov 2026, at 23:27, Nathan Chancellor wrote:
>> >> > Who do you think should take this series? It would be nice if it could
>> >> > start making its way to mainline sooner rather than later since tip of
>> >> > tree clang builds have been broken for over a month at this point.
>> >> >
>> >> 
>> >> Are the first two patches sufficient for that? Perhaps Eric can take them
>> >> through the CRC or libcrypto trees, and I can send the remaining ones
>> >> through the respective arch trees the following cycle.
>> >
>> > Unfortunately not :/ we need the third patch to resolve the error since
>> > that is where the conflict is originating.
>> >
>> 
>> OK in that case, maybe Catalin can take the whole thing via the arm64 tree? 
>> 
>> 
>> 
>> Diffstat:
>> 
>> Ard Biesheuvel (4):
>>   lib/crc: Don't include <linux/types.h> in NEON intrinsics code
>>   xor: arm/arm64: Move NEON xor_gen() dispatch into the glue code
>>   arm64: Drop stdint.h type overrides from asm/neon-intrinsics.h
>>   ARM: Drop stdint.h type overrides from asm/neon-intrinsics.h
>> 
>>  Documentation/arch/arm/kernel_mode_neon.rst | 10 +++--
>>  arch/arm/include/asm/neon-intrinsics.h      | 43 +++-----------------
>>  arch/arm64/include/asm/neon-intrinsics.h    | 24 +++--------
>>  lib/crc/crc64-neon.c                        | 10 ++---
>>  lib/raid/xor/arm/xor-neon-glue.c            |  3 ++
>>  lib/raid/xor/arm/xor-neon.h                 | 16 +++++++-
>>  lib/raid/xor/arm64/xor-eor3.c               | 15 ++-----
>>  lib/raid/xor/arm64/xor-neon-glue.c          |  5 +++
>>  lib/raid/xor/arm64/xor-neon.h               | 31 ++++++++++++--
>>  lib/raid/xor/xor-neon.c                     | 16 ++------
>>  10 files changed, 78 insertions(+), 95 deletions(-)
>
> I agree the arm64 tree makes the most sense for cross-subsystem arm and
> arm64 infrastructure changes like this.
>
> - Eric

