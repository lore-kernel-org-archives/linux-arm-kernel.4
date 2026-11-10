Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D06606A339
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 20:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VE30Ehj2;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M0ZY+WZi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+RTsY+hReKg5lt2wgpCxfAldMdqWp33FHZKP52N/M7M=; b=VE30Ehj2qy22QPOYw2f4x76icF
	912IIUd5FXAzmmmk5G63DD+tO4qi4LNXFa/k3UzXpprnV9nuAZ34A6So/k+aDLm7N59nvpf7ehIY4
	4eEYZsyyZxNMZWdYCvqJI6G4TODpx21IBx0Nu1P423XeLZEgU1egGwUB9itcnXkg3RePS8FTw6e51
	MMu/u9iLufQA8sxKV/Wzc42NyCix6l6NReQRRR90CTOpxeDJad/8nHasDoy5iidQDaekBftqhH9Hu
	odcQD0OqsXbye3uG98cIJ9ips7SCTCbTONtEMRmjrjjNRHz/BljnPrigbi6P1Wk2KKD+7xr7eyMip
	MoSSytrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQsjv-000000050e2-1ArH;
	Tue, 10 Nov 2026 20:46:47 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQsjs-000000050cu-21a9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 20:46:45 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c45551fa84eso374454966b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 12:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794343601; x=1794948401; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+RTsY+hReKg5lt2wgpCxfAldMdqWp33FHZKP52N/M7M=;
        b=M0ZY+WZiN4gSRWsY57lBCcciVXJo4KA2LPbOxNQbWfqATMXhv/aj8xBnwTDwharQnC
         cvQV+b9fwvf5OrE2aTfKK0F0Jxx5ZPZEMVod3urFx0i4k057Vn+wWlC25qoAY640v74S
         q10gqAthcFGmx7SK94HtkiMTPfaYgDWh5BGRPT0BSuu0n0iTDEc29nf+IYssrJoXxl6/
         R2ehRumtgmvGXSaxn/6oBXNMKHSV51WcAMwGf9RZuLlq9SZA4SV3hf3ez+xqYlteYyxa
         XinSlQUbl5ZEA9OnctWB/fQl76/bM/6khn2smBfVIefdZB01iGbpY1FS797dxtLpbvpS
         BeKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794343601; x=1794948401;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+RTsY+hReKg5lt2wgpCxfAldMdqWp33FHZKP52N/M7M=;
        b=y8nOZgxswb6Q9LGudeKgh7e+iURuWo6Vecnl1yebwA4OUO7FRgeyzPi6FkZM+O7Bnb
         dYArXx6lXyk2zGeUYhs+0L6ZM9MYEREvzWhqqgUBiokuAR9Uueca8HXFdgubDyQbDqge
         d2KKRKHMtIpVx85C2pH2IHsZCggJjXuDgUJ9fCvpF6k8QuPVIc0BciaDxRJBnfYOf6Bj
         5upYpkKIsmjFkG2A/O2h0/Mm1NwnwfwEdJhrv9uJtbyldGwmbn9YP+R+msg+Po0cLdr2
         vHvLM1qPB7/XCAB00T7lXB9onfHbdoAybXFfRIMbaxBTCeS0KUE6GV/0mBqFpR/5750M
         LlNw==
X-Forwarded-Encrypted: i=1; AL+hErEngse2HmgvVcfKqgMjeb4hv0XYsMPLuCrhwFxnei1kzeWbt808zecNWi9X7z4fy6V2V7DRWD+CFwSaGd3KeocL@lists.infradead.org
X-Gm-Message-State: APuU4Z+lc3CzqLKbYyxoKRYDaWsev+LXyBNd0mOL3gX2Q+CGCP0nh5ZT
	cqHKbX5n3dJwLFiTeZTGzGQlw09lsJfLL7Lo05nWetNuv5zk7+TaVf5nc0jYXcSG/Q==
X-Gm-Gg: AYBFou3t23+IGUBFPzSxxFQeMQ+XzY9JaVmThMn7b8n6HKm94KdrfC0MmlmX3Z/9FFy
	psQLmdWjOrP5T1Yfx8xHWjTosRfZg8xcjC14phuDk6AeDQFTC4AnE3HmHJRgHCiw1jkRL8bxlhY
	C6jti1Kl7LPpYoWBVIq9lX0waGCbFfvoVL68A13xkHvUFusO3Utpk7z6ltuJ2sVL6kk/cdY4oM7
	q2lsA105n8dCRUMNKo8stf5J3MRaSdYaZNHhXrHq5RCP60NAkH6tfRjSSNqnpaDTdvvHWWM41zd
	DIsW4bxjrOLn7M06l2jznQPJfVKWhOG9SPN/CB2A3RsxDDTOD8+y4TYbsqhRZDUT1gopfYFFUOw
	WCXrtry0a7Yrp0aXiLKuRL2Z0hff4UMT+zQVJ+ijACK76nHMGf+7K4zp7QwkmcDpMPoy+xbLriE
	BZfOBXPuWo3dAoNsAkhq4Hh7W+0MrGzl3+QMP0iRhvms+OK2F4MV4TM30PlfKy8rqrn2JIcHknA
	BrY9pRueWhUO6FiwSwJ22UMiEwO9AXmngL/k2NED5lCJoH1iaEMTHb5xH2T1CzxsQzjQWhfuZHA
	MI6tApCK2Mt1ZZ3yghH0gtF/iGC4gkQpwxNX+5K1ORNPNaFasF8OltlQrQ7TjktQ
X-Received: by 2002:a17:907:e98a:b0:c50:5e0a:fbad with SMTP id a640c23a62f3a-c5066c9ecefmr20452666b.39.1794343600726;
        Tue, 10 Nov 2026 12:46:40 -0800 (PST)
Received: from google.com (202.70.147.34.bc.googleusercontent.com. [34.147.70.202])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7579031e0sm1579058a12.29.2026.11.10.12.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 12:46:40 -0800 (PST)
Date: Tue, 10 Nov 2026 21:46:36 +0100
From: =?utf-8?Q?Pierre-Cl=C3=A9ment?= Tosi <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/24] arm64: Check MTE once per fault-handling section
Message-ID: <avN-XAMZ4bZ72vTO@google.com>
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
 <20261107-mte-kasan-split-v1-5-d84ea5f30f94@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261107-mte-kasan-split-v1-5-d84ea5f30f94@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_124644_603708_23F0975C 
X-CRM114-Status: GOOD (  32.99  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 07, 2026 at 04:36:11PM +0100, Pierre-Clément Tosi wrote:
> Call system_uses_mte_async_or_asymm_mode() only once per section. This
> improves performance (fewer instructions at runtime and fewer static
> branches needing to be tracked and patched), correctness (no theoretical
> race between the execution of the section and the static branch being
> toggled, which could leave TCO in an unexpected state), and code clarity
> (no 3-level indirection with redundant checks to flip one PSTATE bit).
> 
> Signed-off-by: Pierre-Clément Tosi <ptosi@google.com>
> ---
>  arch/arm64/include/asm/mte-kasan.h      | 25 -----------
>  arch/arm64/include/asm/uaccess.h        | 80 ++++++++++++++++++++-------------
>  arch/arm64/include/asm/word-at-a-time.h | 22 +++++++--
>  3 files changed, 67 insertions(+), 60 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/mte-kasan.h b/arch/arm64/include/asm/mte-kasan.h
> index 467d1d41a392..b474fca3ea56 100644
> --- a/arch/arm64/include/asm/mte-kasan.h
> +++ b/arch/arm64/include/asm/mte-kasan.h
> @@ -48,23 +48,6 @@ static inline void mte_enable_tco(void)
>  	asm volatile(ALTERNATIVE("nop", SET_PSTATE_TCO(1), ARM64_MTE));
>  }
>  
> -/*
> - * These functions disable tag checking only if in MTE async mode
> - * since the sync mode generates exceptions synchronously and the
> - * nofault or load_unaligned_zeropad can handle them.
> - */
> -static inline void __mte_disable_tco_async(void)
> -{
> -	if (system_uses_mte_async_or_asymm_mode())
> -		mte_disable_tco();
> -}
> -
> -static inline void __mte_enable_tco_async(void)
> -{
> -	if (system_uses_mte_async_or_asymm_mode())
> -		mte_enable_tco();
> -}
> -
>  /*
>   * These functions are meant to be only used from KASAN runtime through
>   * the arch_*() interface defined in asm/memory.h.
> @@ -197,14 +180,6 @@ static inline void mte_enable_tco(void)
>  {
>  }
>  
> -static inline void __mte_disable_tco_async(void)
> -{
> -}
> -
> -static inline void __mte_enable_tco_async(void)
> -{
> -}
> -
>  static inline u8 mte_get_ptr_tag(void *ptr)
>  {
>  	return 0xFF;
> diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
> index f0924dc0bd64..9e3957ee3642 100644
> --- a/arch/arm64/include/asm/uaccess.h
> +++ b/arch/arm64/include/asm/uaccess.h
> @@ -240,6 +240,24 @@ do {										\
>  	(x) = (__force __typeof__(*(ptr)))__gu_val;				\
>  } while (0)
>  
> +/*
> + * We must not call into the scheduler between setting and clearing TCO. As `x`
> + * and `ptr` may contain blocking functions, we must evaluate these outside of
> + * the critical section.
> + */
> +#define __raw_get_mem_tco(ldr, x, ptr, label, type)			\
> +do {									\
> +	__label__ __rgm_err;						\
> +									\
> +	asm volatile(SET_PSTATE_TCO(1));				\
> +	__raw_get_mem(ldr, x, ptr, __rgm_err, type);			\
> +	asm volatile(SET_PSTATE_TCO(0));				\
> +	break;								\
> +__rgm_err:								\
> +	asm volatile(SET_PSTATE_TCO(0));				\
> +	goto label;							\
> +} while (0)
> +
>  /*
>   * We must not call into the scheduler between uaccess_ttbr0_enable() and
>   * uaccess_ttbr0_disable(). As `x` and `ptr` could contain blocking functions,
> @@ -286,27 +304,18 @@ do {									\
>  
>  #define get_user	__get_user
>  
> -/*
> - * We must not call into the scheduler between __mte_enable_tco_async() and
> - * __mte_disable_tco_async(). As `dst` and `src` may contain blocking
> - * functions, we must evaluate these outside of the critical section.
> - */
> +/* We handle synchronous exceptions so only use PSTATE.TCO in non-sync MTE. */
>  #define __get_kernel_nofault(dst, src, type, err_label)			\
>  do {									\
>  	__typeof__(dst) __gkn_dst = (dst);				\
>  	__typeof__(src) __gkn_src = (src);				\
> -	do { 								\
> -		__label__ __gkn_label;					\
>  									\
> -		__mte_enable_tco_async();				\
> +	if (system_uses_mte_async_or_asymm_mode())			\
> +		__raw_get_mem_tco("ldr", *((type *)(__gkn_dst)),	\
> +		      (__force type *)(__gkn_src), err_label, K);	\
> +	else								\
>  		__raw_get_mem("ldr", *((type *)(__gkn_dst)),		\
> -		      (__force type *)(__gkn_src), __gkn_label, K);	\
> -		__mte_disable_tco_async();				\
> -		break;							\
> -	__gkn_label:							\
> -		__mte_disable_tco_async();				\
> -		goto err_label;						\
> -	} while (0);							\
> +		      (__force type *)(__gkn_src), err_label, K);	\
>  } while (0)
>  
>  #define __put_mem_asm(store, reg, x, addr, label, type)			\
> @@ -337,6 +346,24 @@ do {										\
>  	}									\
>  } while (0)
>  
> +/*
> + * We must not call into the scheduler between setting and clearing TCO. As `x`
> + * and `ptr` may contain blocking functions, we must evaluate these outside of
> + * the critical section.
> + */
> +#define __raw_put_mem_tco(str, x, ptr, label, type)			\
> +do {									\
> +	__label__ __rpm_err;						\
> +									\
> +	asm volatile(SET_PSTATE_TCO(1));				\
> +	__raw_put_mem(str, x, ptr, __rpm_err, type);			\
> +	asm volatile(SET_PSTATE_TCO(0));				\
> +	break;								\
> +__rpm_err:								\
> +	asm volatile(SET_PSTATE_TCO(0));				\
> +	goto label;							\
> +} while (0)
> +
>  /*
>   * We must not call into the scheduler between uaccess_ttbr0_enable() and
>   * uaccess_ttbr0_disable(). As `x` and `ptr` could contain blocking functions,
> @@ -383,28 +410,19 @@ do {									\
>  
>  #define put_user	__put_user
>  
> -/*
> - * We must not call into the scheduler between __mte_enable_tco_async() and
> - * __mte_disable_tco_async(). As `dst` and `src` may contain blocking
> - * functions, we must evaluate these outside of the critical section.
> - */
> +/* We handle synchronous exceptions so only use PSTATE.TCO in non-sync MTE. */
>  #define __put_kernel_nofault(dst, src, type, err_label)			\
>  do {									\
>  	__typeof__(dst) __pkn_dst = (dst);				\
>  	__typeof__(src) __pkn_src = (src);				\
>  									\
> -	do {								\
> -		__label__ __pkn_err;					\
> -		__mte_enable_tco_async();				\
> +	if (system_uses_mte_async_or_asymm_mode())			\
> +		__raw_put_mem_tco("str", *((type *)(__pkn_src)),	\
> +			      (__force type *)(__pkn_dst), err_label, K); \
> +	else								\
>  		__raw_put_mem("str", *((type *)(__pkn_src)),		\
> -			      (__force type *)(__pkn_dst), __pkn_err, K);	\
> -		__mte_disable_tco_async();				\
> -		break;							\
> -	__pkn_err:							\
> -		__mte_disable_tco_async();				\
> -		goto err_label;						\
> -	} while (0);							\
> -} while(0)
> +			      (__force type *)(__pkn_dst), err_label, K); \
> +} while (0)
>  
>  extern unsigned long __must_check __arch_copy_from_user(void *to, const void __user *from, unsigned long n);
>  #define raw_copy_from_user(to, from, n)					\
> diff --git a/arch/arm64/include/asm/word-at-a-time.h b/arch/arm64/include/asm/word-at-a-time.h
> index d7a3b69dc8c6..ec72126210d1 100644
> --- a/arch/arm64/include/asm/word-at-a-time.h
> +++ b/arch/arm64/include/asm/word-at-a-time.h
> @@ -10,6 +10,9 @@
>  #include <linux/bitops.h>
>  #include <linux/wordpart.h>
>  
> +#include <asm/mte-kasan.h>
> +#include <asm/sysreg.h>
> +
>  struct word_at_a_time {
>  	const unsigned long one_bits, high_bits;
>  };
> @@ -41,12 +44,10 @@ static inline unsigned long zero_bytemask(unsigned long bits)
>   * and the next page not being mapped, take the exception and
>   * return zeroes in the non-existing part.
>   */
> -static inline unsigned long load_unaligned_zeropad(const void *addr)
> +static __always_inline unsigned long __load_unaligned_zeropad(const void *addr)
>  {
>  	unsigned long ret;
>  
> -	__mte_enable_tco_async();
> -
>  	/* Load word from unaligned pointer addr */
>  	asm(
>  	"1:	ldr	%0, %2\n"
> @@ -55,7 +56,20 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
>  	: "=&r" (ret)
>  	: "r" (addr), "Q" (*(unsigned long *)addr));
>  
> -	__mte_disable_tco_async();
> +	return ret;
> +}
> +
> +static inline unsigned long load_unaligned_zeropad(const void *addr)
> +{
> +	unsigned long ret;
> +
> +	/* We handle synchronous exceptions so only use TCO in non-sync MTE. */
> +	if (!system_uses_mte_async_or_asymm_mode())
> +		return __load_unaligned_zeropad(addr);
> +
> +	asm volatile(SET_PSTATE_TCO(1));
> +	ret = __load_unaligned_zeropad(addr);
> +	asm volatile(SET_PSTATE_TCO(0));

Note that Sashiko identified that nothing prevents the compiler from re-ordering
__load_unaligned_zeropad() w.r.t. the SET_PSTATE_TCO() and the presence of the
exact same expression above is probably inciting it to do so!

I believe that the most robust approach would to use the "memory" clobber in
set_pstate_tco() so that it always acts as a full compiler barrier. I'll address
this (and reorder the patches to introduce the macro first) in the next version.

>  
>  	return ret;
>  }
> 
> -- 
> 2.56.0.455.g6c5a503b38-goog
> 

-- 
Pierre

