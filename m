Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FF4606A882
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 09:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FP4Ue+pg;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=C0Mh/tUY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IN2mFPnuQd6vKEXAVZ/AVu2voATkxJGZ8A+IFo/BFG4=; b=FP4Ue+pgpNyXsm
	WH6k0sxref/MOKnuYf6F7RFUFmA8TlfS0TSt/8V2Jpfx1loXmkCC1w5FtFpJJwZuIm4W15+OyaJvv
	XdngHUmsE3+bnf84uzqFgl/0b9FWztiHxkhufC+mOFpBEhMtvKvL9FW6uP9GRmFODlDWirietnMby
	K0Oh1uRwX2k9HSq3uYOZ6Y8sNBIHvB196tfTZnqQ3GjJp2Gl6L7FuKiLM978lt72WNDu+Cr9Z+YNM
	09g7ZeSclU+45CTeArp4+DecYCLG8oApEutmFj8ggVlipAr59EXzXmicbjzHcwktYjtq8AGpjTq/M
	Ewh/CbJivfl1mo6W649w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnC3-0000000CB5s-0XyZ;
	Fri, 13 Nov 2026 09:03:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnC0-0000000CB53-0YS1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 09:03:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794560609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IN2mFPnuQd6vKEXAVZ/AVu2voATkxJGZ8A+IFo/BFG4=;
	b=C0Mh/tUYqxlFPv8NZDFiC6LfTMgkf4LnAPLXPYsLlpAKRpd4/7n9ttGyO8Th1jVQJJUC7L
	SzGMyPSr4+Rb3fPUn9puAxLRRz4HQdDMnwUF6otjHZdT8lWR1De15+fbSXrL9ghnpSso4E
	FKUtrtqcdFEwEMM/HnhqMWtMqmNBGYE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-K4mxcmFENjGB2KKheFzNQw-1; Fri, 13 Nov 2026 04:03:28 -0500
X-MC-Unique: K4mxcmFENjGB2KKheFzNQw-1
X-Mimecast-MFC-AGG-ID: K4mxcmFENjGB2KKheFzNQw_1794560607
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a0284121c6so3842705e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 01:03:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794560607; x=1795165407;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IN2mFPnuQd6vKEXAVZ/AVu2voATkxJGZ8A+IFo/BFG4=;
        b=a1YWrYXwHw/bFdvdysv2fjiK4klg+U8rJqU+juMJQ2qm6ONW6otpUrpCbo0/gHu5LI
         LL4fD+pJ8w/CZn4QbqPoF4KIG29ycmAvrFgn75otA80iNu7LBZaTCoTZmLgFh09AoU5T
         YSGNII1qhSMTIqgQuozMuFG4JLkz1XcVj6/jBzAolqKUmPH/D0jKemwQFrcDszAAIPBW
         to00jRuoytdbhQ8VJXE9otmNnTs7TYA06UfbF7ITbWbGbmZQrScYSug9iBimv74oQTjV
         roYpOVakcm71WklVR9iRuGwFB1Ww66KzzKAhNWe0fThkhi+NsiNBDD69uRwEHpNtnZfM
         G8WQ==
X-Forwarded-Encrypted: i=1; AL+hErFBMNfXU1tkYviG+byCvfwd5dVdcHC0emB6z8DW1i+RHL239PF43hQ+QFudkset/01IgNZGNNpwUSRX0pm8rUsK@lists.infradead.org
X-Gm-Message-State: APuU4Z+eb4NAqkmJDZUAkKIaVNkDyeg+/cuT4mlMnraCJJwncMvT7XKj
	P1JePpCmFWLIWfjzuE3gpwkQelJztjW8biSlHDPC2+GvPwqRndl9IHupwKFWPqef2OdLlqIi/cG
	yDaJmFNgHK9i4ky5m+kCfph2/2L2WajjA/VHMJm4zrO/CkQk9e4biOK49Q6NjrOyJ9Xxu7+qSWE
	9TD22iHWAj
X-Gm-Gg: AYBFou0rSn5hE9qJaSe7JlQw5N+ohljp5xyHX0Bmr+HrGaenOUoUAYUk6nps/c42POH
	5/RIdivbw1WLZdNz5CULi4u4yMM1EeDhVIXcxk1H09mBe5yndSvIkdcu4C7yiKrOYyeFfmfAqts
	un8+Pzt2yjE1nDoYz0Py6B/ZFprDpuF8NigC10RDMIQr98BRDXzGFuUrQvZHuSc1fx8q+N7dI02
	mDanKcDsDjM2V0Zt6SolXFLG4ONAE97cLQUSfEHbonrudjFeVOY/4BoWIaI+vyr0Y0xTGPeJjC0
	3w1k74EX3bdASlKVYBNYxIPr9BrZ97Ta8qHo4TkjlURLy5IZqhCvT7hSZJk5DSdZu2oCIEONJRm
	ViRrx5kAxXdEWAC0fK4N+LgL/sMpGkrX2EpP/QgUSjKPD6Q==
X-Received: by 2002:a05:600c:1f90:b0:4a1:7d9b:d4ae with SMTP id 5b1f17b1804b1-4bb55a45050mr35631375e9.5.1794560606920;
        Fri, 13 Nov 2026 01:03:26 -0800 (PST)
X-Received: by 2002:a05:600c:1f90:b0:4a1:7d9b:d4ae with SMTP id 5b1f17b1804b1-4bb55a45050mr35631095e9.5.1794560606485;
        Fri, 13 Nov 2026 01:03:26 -0800 (PST)
Received: from [192.168.0.9] ([47.64.115.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb566220edsm61931075e9.0.2026.11.13.01.03.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 01:03:25 -0800 (PST)
Message-ID: <d8e52741-8275-47bd-997c-7b5339a1d213@redhat.com>
Date: Fri, 13 Nov 2026 10:03:24 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] lib/crc: Don't include <linux/types.h> in NEON
 intrinsics code
To: Ard Biesheuvel <ardb+git@google.com>, linux-kbuild@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Eric Biggers <ebiggers@kernel.org>, Nathan Chancellor <nathan@kernel.org>
References: <20261029135020.272082-6-ardb+git@google.com>
 <20261029135020.272082-7-ardb+git@google.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20261029135020.272082-7-ardb+git@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TXu2E4iQKuHZ7NJcYgHerDJ0UFSTp5W_JpDht6k4eqY_1794560607
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_010332_271450_12CEB798 
X-CRM114-Status: GOOD (  20.53  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am 29.10.26 um 14:50 schrieb Ard Biesheuvel:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The kernel's definitions of uint64_t and int64_t in <linux/types.h> are based
> on [unsigned] long long, whereas the ones provided by <stdint.h>, which is
> included by <arm_neon.h>, are based on [unsigned] long on arm64. On 32-bit ARM,
> a similar mismatch exists for intptr_t.
> 
> Including both into the same compilation unit currently only works because
> asm/neon-intrinsics.h overrides the predefined macros that the compiler's
> freestanding <stdint.h> uses to define these types. In order to be able to get
> rid of those overrides, stop including <linux/types.h> into the CRC64 NEON
> intrinsics code.
> 
> Instead, use <stddef.h> for the definition of size_t, and rely on
> <asm/neon-intrinsics.h> to provide the u8 and u64 types used in the prototype
> of crc64_nvme_neon(), which is shared with code that does include
> <linux/types.h>. Use uint64_t for the arrays of constants that are passed to
> vld1q_u64(), so that they match its prototype regardless of how uint64_t is
> defined.
> 
> No change in generated code.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>   lib/crc/crc64-neon.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/crc/crc64-neon.c b/lib/crc/crc64-neon.c
> index 4753fb94a4be..1267df1310be 100644
> --- a/lib/crc/crc64-neon.c
> +++ b/lib/crc/crc64-neon.c
> @@ -3,7 +3,7 @@
>    * Accelerated CRC64 (NVMe) using ARM NEON C intrinsics
>    */
>   
> -#include <linux/types.h>
> +#include <stddef.h>
>   #include <asm/neon-intrinsics.h>
>   
>   #include "crc64-neon.h"
> @@ -11,11 +11,11 @@
>   u64 crc64_nvme_neon(u64 crc, const u8 *p, size_t len);
>   
>   /* x^191 mod G, x^127 mod G */
> -static const u64 fold_consts_val[2] = { 0xeadc41fd2ba3d420ULL,
> -					0x21e9761e252621acULL };
> +static const uint64_t fold_consts_val[2] = { 0xeadc41fd2ba3d420ULL,
> +					     0x21e9761e252621acULL };
>   /* floor(x^127 / G), (G - x^64) / x */
> -static const u64 bconsts_val[2] = { 0x27ecfa329aef9f77ULL,
> -				    0x34d926535897936aULL };
> +static const uint64_t bconsts_val[2] = { 0x27ecfa329aef9f77ULL,
> +					 0x34d926535897936aULL };
>   
>   u64 crc64_nvme_neon(u64 crc, const u8 *p, size_t len)
>   {

Reviewed-by: Thomas Huth <thuth@redhat.com>


