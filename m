Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD474606A8AE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 14:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BaXk1QKj;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KnpQXng4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VKfbvGk8Y/jU9HbOgEOEZOjAkLHcru43E0pVFPAYJBM=; b=BaXk1QKjpbbnZe
	LIanT3Xz+BQQJlSBunxj/08wl3Vcdef0QkTUl/F1sphGX6PEHytqxdKDH9v6vqM/yhRvRNzunA5yw
	3qlv7BSv/vMHqd9gZ89Dpsao7bZlGA0gbwwErRIQRlCKMMSKuft0ESIyur6Oqj0q/lfgEe0/DzRsr
	bjyW7LpIZnqjOsERWlWN0XZiDeeuC4AmhDUy0f1M1vtEal4won7GLEOY2O5g+wSey00Uk0NMFpZjf
	/UvdU6msaDgXsCjgfMFd/G9vQ+5ZEm2DQvVLPUcNwmeAsalUDru0qV2kVzydUxBxUntgUeCWpw3l/
	wj1COqTSnQha+9D00vcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSEiE-0000000GGAh-3U7M;
	Sat, 14 Nov 2026 14:26:39 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSEiC-0000000GG4w-00Yg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 14:26:37 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4b467581b98so15336405e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 06:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794666393; x=1795271193; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VKfbvGk8Y/jU9HbOgEOEZOjAkLHcru43E0pVFPAYJBM=;
        b=KnpQXng4LcJjDPwHtmAGSr6RVZYkE7RhxDtmzSFN2XrCTa09+oTQ5gjutcz/PpW/2z
         Fppl19l0N0n90n6hGgBkR9Efiq142h9PIOUBjcX0O5wNrVubn1kH6ewdPucOdrAH2gCu
         +Idiu95X5Ytlj5f7Tfutnv4FWJun1nCYxZhSZ+NNAYYaVeAxqKxWNH3a7mUjREmBZDBe
         5eDQPLkDOL7TE9FmrK6dsnZ+GqnVpvtQRfg/lTeN+oxjMwtqr+5YuM7rylxWZpBi3aKq
         QkX+b3OHSFFBG+h+Eej8EVJyhh1j0YzHfaNg5zaEPHB4TVh+UJUjuAygirF8yZbWXbdG
         cgtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794666393; x=1795271193;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VKfbvGk8Y/jU9HbOgEOEZOjAkLHcru43E0pVFPAYJBM=;
        b=s/wtb5eEQD22GjaySyda1y4s1K8j2TTlgSFrcI4cScGWoTcgxxJR7kpNeS0u+cnF0y
         ZvoycPtE/CmBAlWuuWLCavtik9IxPONim57wDpWr89wiDxBl4OmaogdycEIdXYhWln1Z
         9FbfFw4fFWBfCVShHmDSV/oq1YzbNqjzt76tXnlsmyyveArDzk8pmCcQTRkkTG8jhD0H
         7+KeKK1Q9rkKCuxuS6EfVspwh+7BRJgh6zRTniSk5SXCkmYhRM30KdgjG0ajoXHXI072
         za+TVLVG430AgizIeRtSGk8UJTOWsdSrfVfIoyxThy/wAeRAGd2Vqbngq0xdl398wxCW
         I/9A==
X-Forwarded-Encrypted: i=1; AL+hErGuxMeO9c+GAX7CDMuaQ+L0bAfDWqRpJ2N/U6LN8pdZgdbELQ3/ciFSOmArXwFT/UbLx6W7m/N0jwG68hsZi1hl@lists.infradead.org
X-Gm-Message-State: APuU4Z+5uPrKDgih0xekiuU7uYpMtoA5z+T8BvfqGLRSibqoVkfQTn7y
	VLzvgl6YGSLaEDKGuAstS2pwS7hNdWzNoOU7Fjph4lAtnxWF0VLfUta/
X-Gm-Gg: AYBFou34S9gvM7QGbBsd+MPTbDiMvLV52hz0GJwOOKEU/trE4Wekwr0aHB+vaUqJq9B
	Ryrf8i82z0Jc+CS3+xPE4RtySIBo/8EU3eq/cKBYHh27KSsA+o+CEkcSu/eVpcBx4sHSgZNeU9K
	LYxWkyBmW5GU4fAoFICJn76IGQXMcJKvTgDPT77Iykb5ljqvsNG2JiJYvayLO8RT7MOhKEV1hMA
	43jVS0ghcV8IFWO/D7vTiMHuPsksca+M8eJCx1xWMEknGgNRzHWlVgLsSu+JAqdWS9p0zhDtt5K
	KwvirUBhK29jNXXmHGm3ygprafpZWutxzWFvsEhh9CWc93P8NQ+jvjCYyGVFI2sGU4htFsnEURx
	AXpAQcG/jazC/T6fv9jl51dzcCeme3Rb6VH+KFCpPKQ64Kc5X2yVslw0H76wH/UEmyiqLDIcH3N
	e4zI5F3P0F3Mv5RkEuPf7hdZCJCGhWp87QeJC7cRhmKAPqPu4KHtsm9wZs4ENHhDW0dI76RVDoQ
	iI3wlrvc7j/6xQ+x9Zcn+P/VUj62Gafo8sTVhyGP714J3RslyBO9CzJRx9w9GUevzlB38pvPzHj
	yAKcR7suvITx30i2nSZGe38Nes0IZRxDBOyI6aG5a9LbnLTrDs+QhcXSDVZ6mbCpqw==
X-Received: by 2002:a05:600c:544:b0:4ba:2bfc:c8b5 with SMTP id 5b1f17b1804b1-4bb55a662f9mr81819625e9.10.1794666393381;
        Sat, 14 Nov 2026 06:26:33 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2842e6sm245199735e9.4.2026.11.14.06.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:26:33 -0800 (PST)
Date: Sat, 14 Nov 2026 14:26:31 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Demian Shulhan <demyansh@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jakub Kicinski
 <kuba@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Saeed Bishara
 <saeed.bishara.os@gmail.com>, Eric Biggers <ebiggers@kernel.org>, Ard
 Biesheuvel <ardb@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Andrew
 Morton <akpm@linux-foundation.org>, Marco Elver <elver@google.com>, David
 Gow <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: csum: Add fused copy and Internet
 checksum
Message-ID: <20261114142631.7352b895@pumpkin>
In-Reply-To: <20261114040943.219870-2-demyansh@gmail.com>
References: <20261114040943.219870-1-demyansh@gmail.com>
	<20261114040943.219870-2-demyansh@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_062636_094218_C7181912 
X-CRM114-Status: GOOD (  31.17  )
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 14 Nov 2026 03:57:00 +0000
Demian Shulhan <demyansh@gmail.com> wrote:

> arm64 currently falls back to the generic csum_partial_copy_nocheck() in
> lib/checksum.c, which performs memcpy() followed by a second pass in
> csum_partial(). This double pass is hit on software GSO paths
> (skb_segment() without SG or TX checksum offload, e.g. TCP over
> WireGuard) and UDP/ICMP replies.
> 
> Implement a single-pass csum_partial_copy_nocheck() in
> arch/arm64/lib/csum.c using four independent __uint128_t accumulators
> over a 32-byte stride, followed by 16/8/4/2/1-byte tail handling. Each
> word is read once into a GPR before storing and summing, emitting paired
> ldp/stp and adds/cinc carry propagation with no stack frame.

Is that right?
I thought ldp/stp required aligned addresses.
The code below is using get_unaligned().
I think the timings below are for ldp/stp?

> 
> Throughput on ARM Neoverse-V2 (Google Axion, 3.0 GHz, GCC 15.2 -O2,
> warm L1 cache):
> 
>    len   memcpy + do_csum   csum_partial_copy_nocheck   speedup
>   ----   ----------------   -------------------------   -------
>     64         10245 MB/s                  15902 MB/s    +55.2%
>    256         18851 MB/s                  26026 MB/s    +38.1%
>    512         22465 MB/s                  28421 MB/s    +26.5%
>   1024         24330 MB/s                  29900 MB/s    +22.9%
>   1368         24192 MB/s                  30221 MB/s    +24.9%
>   1448         24188 MB/s                  30279 MB/s    +25.2%
>   1500         24165 MB/s                  30096 MB/s    +24.5%
>   4096         25299 MB/s                  29946 MB/s    +18.4%

That is topping out at 10 bytes/clock.
Each loop iteration copies 32 bytes - so must take 3 clocks.
Which means it must be doing 16 byte read/write in a single clock.
So rather begs the question of why it is limited by the loop control
and checksum instructions rather than the memory accesses.
The checksum code needs 4 ALU instructions (for 16 bytes), if the CPU
can execute more than that then there is half a chance of getting the
loop down to 2 clocks.
Just moving one (or both) the pointer updates into the middle may help.
Otherwise you try using negative offsets from the end of the buffer
and 'reg + reg' addressing (will need more pointers since I don't think
arm has 'reg + reg + offset' addressing.

> 
> Suggested-by: David Laight <david.laight.linux@gmail.com>
> Signed-off-by: Demian Shulhan <demyansh@gmail.com>
> ---
>  arch/arm64/include/asm/checksum.h |   3 +
>  arch/arm64/lib/csum.c             | 100 ++++++++++++++++++++++++++++++
>  2 files changed, 103 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/checksum.h b/arch/arm64/include/asm/checksum.h
> index dc52b733675d..9f766db01152 100644
> --- a/arch/arm64/include/asm/checksum.h
> +++ b/arch/arm64/include/asm/checksum.h
> @@ -44,6 +44,9 @@ static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
>  extern unsigned int do_csum(const unsigned char *buff, int len);
>  #define do_csum do_csum
>  
> +#define _HAVE_ARCH_CSUM_AND_COPY
> +__wsum csum_partial_copy_nocheck(const void *src, void *dst, int len);
> +
>  #include <asm-generic/checksum.h>
>  
>  #endif	/* __ASM_CHECKSUM_H */
> diff --git a/arch/arm64/lib/csum.c b/arch/arm64/lib/csum.c
> index 75db718e5b6a..a9617cde28c1 100644
> --- a/arch/arm64/lib/csum.c
> +++ b/arch/arm64/lib/csum.c
> @@ -2,8 +2,10 @@
>  // Copyright (C) 2019-2020 Arm Ltd.
>  
>  #include <linux/compiler.h>
> +#include <linux/export.h>
>  #include <linux/kasan-checks.h>
>  #include <linux/kernel.h>
> +#include <linux/unaligned.h>
>  
>  #include <net/checksum.h>
>  
> @@ -116,6 +118,104 @@ unsigned int __no_sanitize_address do_csum(const unsigned char *buff, int len)
>  	return sum >> 16;
>  }
>  
> +static __always_inline __wsum csum_fold128(__uint128_t sum)
> +{
> +	u64 s;
> +
> +	sum += (sum >> 64) | (sum << 64);
> +	s = sum >> 64;
> +	s += (s >> 32) | (s << 32);
> +	return (__force __wsum)(u32)(s >> 32);
> +}
> +
> +/*
> + * Single-pass copy and ones' complement sum. Each word is read once into a
> + * GPR before storing and summing, so the returned sum always matches @dst
> + * even if @src is concurrently modified.
> + */
> +__wsum csum_partial_copy_nocheck(const void *src, void *dst, int len)
> +{
> +	const u8 *s = src;
> +	u8 *d = dst;
> +	__uint128_t sum0 = 0, sum1 = 0, sum2 = 0, sum3 = 0;
> +	unsigned int n;
> +
> +	if (unlikely(len <= 0))
> +		return 0;

Hmmm...
Does zero actually happen often enough for that to be a gain?
Even with the unlikely() it is likely to slow down the normal path.
And that assumes that the branch isn't mispredicted and that gcc
doesn't ignore the unlikely(). 

> +
> +	n = (unsigned int)len >> 5;
> +	if (n) {
> +		do {
> +			u64 v0, v1;
> +
> +			v0 = get_unaligned((const u64 *)s);
> +			v1 = get_unaligned((const u64 *)(s + 8));
> +			put_unaligned(v0, (u64 *)d);
> +			put_unaligned(v1, (u64 *)(d + 8));
> +			sum0 += v0;
> +			sum1 += v1;
> +
> +			v0 = get_unaligned((const u64 *)(s + 16));
> +			v1 = get_unaligned((const u64 *)(s + 24));
> +			put_unaligned(v0, (u64 *)(d + 16));
> +			put_unaligned(v1, (u64 *)(d + 24));
> +			sum2 += v0;
> +			sum3 += v1;

Is using sum0/1 here actually slower?
My 'gut feel' is that it won't be - and saves the adds below.

It is also worth checking that gcc doesn't zero extend v0 into a
register and then do a full 128bit add.
I'm sure I looked at the code using only 64bit variables for:
			sum0 += v0;
			carry0 += sum0 < v0;
both gcc and clang used 'add 0 with carry' for the second line.

> +
> +			s += 32;
> +			d += 32;
> +		} while (--n);

It is a shame to have to update 3 variables here.
They may be taking the 3rd clock.

David


> +
> +		sum0 += sum2;
> +		sum1 += sum3;
> +	}
> +
> +	if (len & 16) {
> +		u64 v0 = get_unaligned((const u64 *)s);
> +		u64 v1 = get_unaligned((const u64 *)(s + 8));
> +
> +		put_unaligned(v0, (u64 *)d);
> +		put_unaligned(v1, (u64 *)(d + 8));
> +		sum0 += v0;
> +		sum1 += v1;
> +		s += 16;
> +		d += 16;
> +	}
> +	if (len & 8) {
> +		u64 v = get_unaligned((const u64 *)s);
> +
> +		put_unaligned(v, (u64 *)d);
> +		sum0 += v;
> +		s += 8;
> +		d += 8;
> +	}
> +	if (len & 4) {
> +		u32 v = get_unaligned((const u32 *)s);
> +
> +		put_unaligned(v, (u32 *)d);
> +		sum1 += v;
> +		s += 4;
> +		d += 4;
> +	}
> +	if (len & 2) {
> +		u16 v = get_unaligned((const u16 *)s);
> +
> +		put_unaligned(v, (u16 *)d);
> +		sum0 += v;
> +		s += 2;
> +		d += 2;
> +	}
> +	if (len & 1) {
> +		u8 v = *s;
> +
> +		*d = v;
> +		sum1 += v;
> +	}
> +
> +	return csum_fold128(sum0 + sum1);
> +}
> +EXPORT_SYMBOL(csum_partial_copy_nocheck);
> +
>  __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
>  			const struct in6_addr *daddr,
>  			__u32 len, __u8 proto, __wsum csum)


