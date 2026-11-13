Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409E4606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g1LBbllh;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ayS2AFLo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qttE7i/NYMGEyijPDXwoBLWDxtH3LyQR/xHbwik0TMo=; b=g1LBbllhZJRyde
	is6J65eWON+ZVxqW2UEInjvK3cQeLyVeoTnSrHMqie/ZhqL+bLeha9pwCsbsSUQM1FysmPKosUOKu
	N9RhHKkP0DjS7Vl5x2LwEJ8GiKOD11PkyoZavOf+rsthHzHjrCk6xDrJ/PlVLm9bJ89O9RDmXEWoF
	+VUoC28MJIlwV6M2lLIBomyaOmaNQ2J+mXQb6f5nhvoCa5JrPtzR307dFrSjU38wQvNfZ5/ww1pXi
	RMvZoDB4xOal/V+Pyaweo17chVk4BCi3e4HrOJi24NRQXZ71I7FFuD6JvE0jumdLzDXO0gC9P9JOx
	L/t9nsKO2oNHWv7vMQ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoVn-0000000CMgf-1BqE;
	Fri, 13 Nov 2026 10:28:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoVj-0000000CMfO-0l1A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:28:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0403B1BB2;
	Fri, 13 Nov 2026 02:27:55 -0800 (PST)
Received: from [10.57.67.215] (unknown [10.57.67.215])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 065AD3F673;
	Fri, 13 Nov 2026 02:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794565678; bh=sniyVvy7eqHqmejSGAzUGcpDdk2gZp+cN0PLHrSDCc8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ayS2AFLog3ARBcBC8Rp6U2yO2Jhb/mY4HBYhUzNqyQWWla3xl+YPBIwNxbqF6N3CM
	 z1YsWOacUrBYT1pAib+Lcvza532CUEYyWehckXaNG7pQ2fAvWAYFlcAPIUjR+8u/oV
	 acLNvKcxJ1dS8XGxOBWXHKPxWggrWidI8lqZzApg=
Message-ID: <9a479160-5bab-42f8-bf50-7b92c40b39c0@arm.com>
Date: Fri, 13 Nov 2026 10:27:54 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 08/10] coresight: Add CORESIGHT_DEVID2 to
 linux/coresight.h
Content-Language: en-GB
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
 alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
 konrad.dybcio@oss.qualcomm.com, james.clark@arm.com, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 songchai@qti.qualcomm.com
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
 <20261113024935.3173715-9-songwei.chai@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261113024935.3173715-9-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_022801_323077_89652A65 
X-CRM114-Status: GOOD (  14.22  )
X-Spam-Score: -4.4 (----)
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

On 13/11/2026 02:49, Songwei Chai wrote:
> CORESIGHT_DEVID2 lives at a fixed, architecturally-defined offset
> (0xfc0) within the generic CoreSight management register block,
> immediately preceding CORESIGHT_DEVID (0xfc8). Components outside
> drivers/hwtracing/coresight/ that follow the same register convention
> (e.g. the Qualcomm TGU, which uses it to detect its timer/counter
> capabilities) need to read it too.
> 
> Add it to the public include/linux/coresight.h so it can be shared
> outside of drivers/hwtracing/coresight/, matching CORESIGHT_LAR and
> CORESIGHT_DEVID already moved there.
> 
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   include/linux/coresight.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 5286b3606581..7ce0366c7c70 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -37,6 +37,7 @@
>   #define CORESIGHT_UNLOCK	0xc5acce55
>   #define CORESIGHT_LAR		0xfb0
>   #define CORESIGHT_DEVID		0xfc8
> +#define CORESIGHT_DEVID2	0xfc0
>   
>   static inline void CS_LOCK(void __iomem *addr)
>   {


Merge it with Patch 1 please.

Suzuki

