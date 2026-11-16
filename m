Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBF7606A337
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 11:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c7GF3Z6e;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nTDWtsCN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=g73PX0PTBDOigD/y1VmqsLoo3oXmbxRQK+YkYSvt5eM=; b=c7GF3Z6ebNgJr32iT4nDSfWA0i
	GIXw9U1398X95AW2PPUbL/vnPS6GRlKEfFeTiMTvAhW6uVwzONl/RJn/7AmND5z0G4G7BB3Fl4nD2
	MJ1cydlVCTsymx0k6cj+OaPboFUQQ/OnSb3ftDJtV3g/ghs3TqEhMdtN2G/AjFlCt5g5RrEc296yx
	q16EXibRR1nRchXv19WmY+s5/3BwjoEmoOwKWJmHg0wCudhjAA35/hiDjlefLZdohJ2gjvReDzp5E
	9kIcaBGb0tEiLbTiLsTj1bR/0FHQWtGjBdZLwVgPJclH8FZLitM5ZO+5PSvYzcOrvnhuM110Y2byD
	bgZS8+lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSutC-00000002BPU-0sLZ;
	Mon, 16 Nov 2026 11:28:46 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSut9-00000002BNr-3kbn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 11:28:45 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-49d64a88222so1340001f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 03:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794828521; x=1795433321; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g73PX0PTBDOigD/y1VmqsLoo3oXmbxRQK+YkYSvt5eM=;
        b=nTDWtsCNdMFYsgoG2gCEZInVkQGxbtTXz54RexkLK5bEw/CPAcAQNhw5RGzKUjtQ7m
         3PE2El23IdoTsu+xQYUPBfxVQdmbfwP8FF+2DwSxZaMhsDDpiaCIPRISC4j/OZPAlUac
         1I5DY6KMQGykoKd0zezJfp3wpyyy3qHxpwpjlrpjxkPHd5CrdMapsjIvPpZqSmb7kWK6
         cRWd/KHH/dSdbcCdWcyelk93xV3Pga8997cXkXiE3AtRi+83r+nUhFa1bjx9dYbqSLo0
         Jhd1xTbIyA5vV/lu/4UlCbB6hsFcqM8wywOTmhKGMRa41wgX9Tk4+ttkCAHbNFCOa2qz
         ha6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794828521; x=1795433321;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g73PX0PTBDOigD/y1VmqsLoo3oXmbxRQK+YkYSvt5eM=;
        b=eG0y2heGBtNLYa7SQWm8wEjj+Yhi7nwhB5EuWAol8PsCVTmFNZO8zY24j/7mffdcG/
         LxZHlTZfJtc259y+2b/xiZe2MDVu+BWBGC3edB80D/4Iw+CuFe04Wkh1+2TfgPH0Ix0A
         +jojTUjcoTxhBTg13xohBtbz3gnZmoKFGwQRb6rFD/xwGO1JT4AfiWZUa7OOAFGQA3v+
         Kmi59hYpLT/ebk0ccmbqaXr1OUgCIks5sse6OmhTr5IyGa+fBBRJOKuTbzfMGCSwd5B8
         gcyYQXN713H/dweyAFes1am9XBrcGJ9WQwHgK2TWLoiH+w1TVwmJLgYFeTGxC9K1IVe1
         Xjog==
X-Forwarded-Encrypted: i=1; AL+hErG++fXjvL4xUnSE/hDgJlaFH4f15Ywbzg8PiS9chRzdl6uA8mTotnN94LOQeVoZbaraqNON4n1ZsZTnE6tphCFX@lists.infradead.org
X-Gm-Message-State: APuU4Z/7Yk0QSz0NNW+jHMaNIRpwxbnWDHwogUpdJi+1dM8027IsqPgl
	N4vSCBEwxQxEZh7jBsDd6K0V6QbQEroO/ehZemMo0kJDNUGeyxZKqnNtxr6sXI/beg==
X-Gm-Gg: AYBFou3anary4ypY6nQKudHURCIb7LQA1yL0M2OW6b9fhPB6a6sl6GdTB+8B+d+CMsa
	nZVe9UqlcbiP+7bbV8K49DFD6f+sA78P1eAYsGKBBbd1ts6aZ1a2tXcBk99f9iQ0mZXLP6rXjub
	7d76TpqsZPyM6g6ogzn9vbIo5cv3FAtOolfXnsbwC/v46QrjYOI7a2B9si91l76IdgS8BZaKYyx
	0wjqet5oq+n/+RNur3RJcCfz2MDxz91ybkE+dnCePJCmqfTFrNWm8e7V8uP0dCtU+/2Kr79zyHR
	qguaAw+wRC9DJ6zXAoWs8brvn1FpvSmOKHZSrbJHtQSRcUT12HHKxW2RwltbSVlBtDiOqqWi5Ms
	hWn/nFJhIZWz7u9y5frfCBBNS2lhWOfuSM2TqvTZ28N4gGB2+2JxLwU3RUgqrm9wtB1PVJIewDD
	g9J1qWnS+Da3SkSd0VzJqVhlrO1Ac+45ionKdvPAT3eC04nkr3xKmIx+u5OHiUYpKiezTgLFAzE
	X6rM7Iw9lRezwiE9ujx7cRVyKAPHkUdrUF7LiP0RJLCfeBKsy745ZuCxteiHrHaXTRktCJ5/vqx
	p1zqK/xzYsbCTv33P/LkzaLIJ+ONk5RdP436izqXzUReoPS0cqjIeNFZn6DrBYhKZQ==
X-Received: by 2002:a05:600c:5903:b0:4bb:60b3:7ea9 with SMTP id 5b1f17b1804b1-4bb60b38023mr126053495e9.0.1794828520786;
        Mon, 16 Nov 2026 03:28:40 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c604ee47dsm21324022f8f.38.2026.11.16.03.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:28:39 -0800 (PST)
Date: Mon, 16 Nov 2026 11:28:35 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Mostafa Saleh <smostafa@google.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>, stable@vger.kernel.org
Subject: Re: [PATCH] drivers/virt: pkvm: Zero and clean memory before sharing
 it with the host
Message-ID: <avro44jUWOARFzul@google.com>
References: <20261116110549.1863653-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116110549.1863653-1-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_032843_986435_B0A00136 
X-CRM114-Status: GOOD (  28.95  )
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

On Mon, Nov 16, 2026 at 11:05:49AM +0000, Fuad Tabba wrote:
> From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
> 
> On pKVM, set_memory_decrypted() shares pages with the host in place and
> without cache maintenance. The atomic pool, dma-direct and dynamic
> SWIOTLB pools zero their memory only after sharing it, so unless the
> page allocator has zeroed it, the host can read whatever the guest last
> left in it. Zeroing first isn't enough on its own, as the zeroes may not
> have been written back to memory, and a host that maps the pages
> Non-cacheable then reads the old contents.
> 
> Zero the range and clean it to the PoC before sharing it, so that no
> caller can hand the host stale data.
> 
> Fixes: ebc59b120c588 ("drivers/virt: pkvm: Hook up mem_encrypt API using pKVM hypercalls")
> Fixes: e62decaf98e7c ("arm64/coco: Add pKVM as a CC platform")
> Link: https://lore.kernel.org/r/20261116091137.94252-3-aneesh.kumar@kernel.org
> Cc: stable@vger.kernel.org
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> [fuad: take the pKVM hunk of v10 patch 2 as a standalone fix, add the clean to the PoC]
> Co-developed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
> 
> Notes:
>     This is the pKVM hunk of patch 2 of Aneesh's v10 [1] plus a clean to
>     the PoC, taken on its own because it fixes a bug that has exposed
>     guest memory to the host since v6.12.
>     
>     Based on Linux 7.4-rc3 (aebb727447640).
>     
>     [1] https://lore.kernel.org/r/20261116091137.94252-3-aneesh.kumar@kernel.org
> 
>  drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
> index 26fe9c3f22e36..81d1cd24a2eff 100644
> --- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
> +++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
> @@ -9,10 +9,12 @@
>  
>  #include <linux/arm-smccc.h>
>  #include <linux/array_size.h>
> +#include <linux/cacheflush.h>
>  #include <linux/io.h>
>  #include <linux/mem_encrypt.h>
>  #include <linux/mm.h>
>  #include <linux/pgtable.h>
> +#include <linux/string.h>
>  
>  #include <asm/hypervisor.h>
>  
> @@ -61,6 +63,15 @@ static int pkvm_set_memory_encrypted(unsigned long addr, int numpages)
>  
>  static int pkvm_set_memory_decrypted(unsigned long addr, int numpages)
>  {
> +	size_t size = numpages * PAGE_SIZE;
> +
> +	/*
> +	 * The host can read the pages as soon as they are shared, possibly
> +	 * through a Non-cacheable mapping. No caller relies on their contents.
> +	 */
> +	memset((void *)addr, 0, size);

Are we sure we want that? The guest may want to setup memory and then share it.
I am not sure about modifying this API. 

> +	dcache_clean_poc(addr, addr + size);

I believe the hypervisor is already doing the cache maintainance when the page
is mapped back into the host. (see stage2_map_walker_try_leaf())

-- 
Vincent

> +
>  	return __set_memory_range(ARM_SMCCC_VENDOR_HYP_KVM_MEM_SHARE_FUNC_ID,
>  				  addr, numpages);
>  }
> 
> base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
> -- 
> 2.47.3
> 

