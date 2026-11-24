Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97828606A695
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rGWWxGoh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=BDWIYkbr;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QbzCjmMm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BTVY4aU3/L8miJpqzvWLyd9xWFkG1Y6BaRFcJkDciFA=; b=rGWWxGohdz20cahLMlJa3cxKym
	d1ke8LIHy/RyT/Hi6E+E2PnHPKUk/ifDN73ONqVHu76aCteFVvsxkxFDKILg5VnGEQ0frKPjIQPj4
	UZJ3qfyT2N3IMbErM7RYR1cfxPpXLcLwmgVS8XC5SrTmlWIwDhavg7zFYLAEUi0yiKF8pzvVsiaQq
	J1BnQFIpLIrEO8zzEPwniN3M9HA+2kKj3R7266kKKLzv4E8jaiCo7MQuZaftIL20jLe4dlvm+22B2
	DYxYwOyAF1Kwp8F1HBBbYRXAEK57vqcv+mJm9G0L5ko8c9NKiJpIOz8bZCg134Ktotuv1D4effna9
	vaNjZSSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuNS-00000007Mu6-0Rht;
	Tue, 24 Nov 2026 17:32:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuNM-00000007MsA-1Xse
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Nov 2026 17:32:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BTVY4aU3/L8miJpqzvWLyd9xWFkG1Y6BaRFcJkDciFA=; b=BDWIYkbrsILTEblpN/25qvdIfp
	gAPeFezM5gbiFqA/f2joP9Dx6GMgCOE+z7AN58BEl1uck4klznfIn9JEm4aDMxzKgz6psuot84Zts
	HeXf3qOjD6IhUvGkgVA2A3kpxWhdCwtQ/8+hQzTnj71rg4A/xOW6VzvASVHNTNzN4BCrGPYHflmuh
	C3pBEztwN0ph1+fM2TxjcIIZbMrh6kDVf7d22HlQ/GzVtYYj0gsmbWEQm7Qt9sOlUAUCMz4mwhSYX
	K2lcphrhvamKLx6i85dw1gOItp+id0Za3QaypTjnaLcobShgSYklVc/Gi7hA0h8X5J3iRoZrc88Wp
	Fa6ileUA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuNJ-00000004PZW-2jkT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 17:32:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42FC9339;
	Tue, 24 Nov 2026 09:32:08 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC4F13F763;
	Tue, 24 Nov 2026 09:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795541531; bh=y+ueAXDgxzoT7mF7z9hhxx0rxTk5jOpaLKQ8IkUeO1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QbzCjmMmg7TyLgKT+xUclxK1kp6FLshpTNpBNLnf/txH31j5v82n1H9jT1ZN8Cqk4
	 k0Apd8y126QCGBt6QIwo6PVAveC3op3lmv7p8Kta4VZlDXiSV8enXJVvD13SBAg/Hs
	 M1GcEsgah8M9GWmhbRHZQIf0g70tPUsSnJPRadCQ=
Date: Tue, 24 Nov 2026 17:32:06 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: =?utf-8?B?6buE5Y2O5oiQ?= <1112433017@e.gzhu.edu.cn>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	will <will@kernel.org>, "mark.rutland" <mark.rutland@arm.com>,
	broonie <broonie@kernel.org>,
	"szabolcs.nagy" <szabolcs.nagy@arm.com>,
	"yury.khrustalev" <yury.khrustalev@arm.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	stable <stable@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: gcs: bind signal GCS restore to the live
 GCSPR_EL0
Message-ID: <awXKFu9PAifaCay5@arm.com>
References: <tencent_122AB752205D1FCC2B359940@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_122AB752205D1FCC2B359940@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_173213_826858_9BCD463C 
X-CRM114-Status: UNSURE (   8.38  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.5 (--)
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

On Mon, Nov 23, 2026 at 11:56:52PM +0800, 黄华成 wrote:
> Bind the restore to the live, kernel-visible GCSPR_EL0: for every
> legitimate restore at every nesting depth the innermost frame's gcspr
> equals the live GCSPR_EL0 (the handler's return pops its trampoline
> record before rt_sigreturn).  Userspace cannot move the live GCSPR_EL0
> without executing GCS instructions, which are themselves checked.

(that's a pretty malformed patch, missing sign-off, lines not wrapped,
based on an older tree)

Changing GCSPR_EL0 via sigreturn is the intended ABI (see
preserve_gcs_context() and Documentation/arch/arm64/gcs.rst). Any valid
signal cap token is acceptable, including an outer context's token.

The patch would also break handlers that call rt_sigreturn directly,
user-space stack switching and checkpoint/restore.

In conclusion, NAK.

-- 
Catalin

