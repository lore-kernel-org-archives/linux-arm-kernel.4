Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A433606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 12:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cwhm/DYP;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vJorRfRN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UxFEXeB/Pzb/ceZWieldlDl9uSZkIWZBPtfFh0hEfJM=; b=cwhm/DYPQxcjYwzHBdOE53fODA
	K7SnvEFgv3vCYQs2M3E+lyu3GI+3OFh31IW12/HdW2NLCe3AUSA6U/N0nJMZPhhslyfxtjur0cYZx
	r8J6KYWqyBn0isdtssDgQCqkl9E8356MSiLV3VinYQxcYLvPolaYJuVyh0KIuybrDprFJR5Lf4v+z
	dbP8yyXEFL8l6ATQPo7zlb4IGZRN0hT3S1GdEPQbHz9qODbYFXG2eTBIEvQBNfWtyWoaksp36j0UV
	GYx1H6iGfL3SmPSlCqJTMWOCbtS/1z72C3UdHr1UNiS4yDHMMwzihbLCA/Z0L+yIyH9wNoBY2Z+7Q
	KtoxHMHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0vv-0000000BmfN-3N9w;
	Thu, 19 Nov 2026 12:08:07 +0000
Received: from out-64.mta0.migadu.com ([2001:41d0:1004:224b::40] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0vt-0000000Bmes-10Gr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 12:08:07 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=uvou6fvzsWx7brWg2uRljIGCw/YRWGhDfGuc7FjFWDw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795090082; v=1; x=1795694882;
 b=vJorRfRNR/uYgIpoj7NLTB2aeaJAMTxPKzCTaGTBXk2IoJahrclt59O/sSROP17dzKTBz+08
 lwKUmiz6eA8qkAs9l0CjEkSa78S5g6P81ITcR3bg7mmoHLoKzkkh1khJwUdUK5saHr7lAU26X1B
 VNmzz0fOiA8SjX/gWmT1oKdg=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 83a66a15c14d3532;
	Thu, 19 Nov 2026 12:08:02 +0000
X-Mizu-Trace-ID: 83a66a15c14d3532
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so7663e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 04:08:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG+3FAGipRnRSvNA4RRn5cI3J4j96n4LwEyPxwqhTr2IroVFH9fK8SuaP3vgXbu6PaasMKunahK0Y2WOywEH6p7@lists.infradead.org
X-Gm-Message-State: APuU4Z+UWdtSb060kekza+c2vCyuFK4mL+sqs/FZUCQj1ykSyuTuZTQY
	M4znxS3B93vMXRCYyBBVYtxqmy8Uh0dXPXlq7jszIfWmkHRGLkfZiAnJd/LAySyLnXEfZiDn6+P
	jiIQpEMVUF7K8vHKyfsHqNmpitf8uEj+ntOZcw5xI
X-Received: by 2002:a05:6512:b86:b0:5c1:4cc8:2f22 with SMTP id
 2adb3069b0e04-5c1b66e7f30mr61719e87.8.1795090080312; Thu, 19 Nov 2026
 04:08:00 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
 <20261118-host_gicv5_fixes-v3-12-13c1859e8aa3@arm.com> <av7PQ4iniwWC9goF@red-moon>
In-Reply-To: <av7PQ4iniwWC9goF@red-moon>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 19 Nov 2026 12:07:23 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwYexVk5tgHNorQVHwxLThT3nFzjYz50oYp=xhrd1LXDg@mail.gmail.com>
X-Gm-Features: Aa3M54prNB5a7w6aglbYUO3HHB9TG1Y0B_WAoNyRQhIl_db8bZOox8P-QBAm1hM
Message-ID: <CA+EHjTwYexVk5tgHNorQVHwxLThT3nFzjYz50oYp=xhrd1LXDg@mail.gmail.com>
Subject: Re: [PATCH v3 12/14] irqchip/gic-v5: Retain the ITT when device
 invalidation times out
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Timothy Hayes <timothy.hayes@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jonathan Cameron <jic23@kernel.org>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_040805_870078_DE74106E 
X-CRM114-Status: GOOD (  11.17  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 19 Nov 2026 10:28:19 +0000, Lorenzo Pieralisi
<lpieralisi@kernel.org> wrote:
[...]
>> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
[...]
>> @@ -570,7 +570,9 @@ static int gicv5_its_device_unregister(struct gicv5_its_chip_data *its,
>>          its_write_table_entry(its, dte, 0);
>>
>>          ret = gicv5_its_device_cache_inv(its, its_dev);
>> -        gicv5_its_free_itt(its_dev);
>> +        /* Only release the ITT once the ITS has discarded its references. */
>> +        if (!ret)
>> +                gicv5_its_free_itt(its_dev);
>
>         if (ret)
>                 return ret;
>
>         gicv5_its_free_itt(its_dev);
>
>         return 0;

In this error path and the one in gicv5_its_device_register(),
kmemleak will report the retained ITT once the caller frees its_dev.
Could you mark the ITT allocations with kmemleak_not_leak() on both
paths, l2ptrs included for a two-level ITT?

With that added:
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

