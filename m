Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CD1606A325
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 04:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cPt5b1Ah;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=aC8oy7DI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:To:Mime-Version:Message-Id:Subject:References:Content-Type:In-Reply-To:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mjCS2cccvac/fD96GCgBgLZYurJFuPvJEGsUseQ1xMA=; b=cPt5b1AhhSEvXg
	SYgb15bcGnun1dRyW9JzAaiSf1B8F/J/qi8DlRoni4dgg4y6K/M5SI8dNm8u3W+uob0RIJ2kj1l74
	pXU6DscDLCeffzTLIOi/iy/KRAP9eIbZCFIo+IGHnuO6Wbuz8q2brwJAe/0B2/I7Zcr93UvkbSPMp
	VMJkFyTMo+qEz1+6lB9nhsnC4giQIQjnrwBHbQZsWyqHFT1dCDFA3U3PfzlGyhfp1ExoolNYPcuoi
	3nSlYFoj9kzf/0DUeddjkmvGgWykmSFhZXm5guTXqRD1ciGaP8HDF60YRyw+Q+Z5P+pTRRfudqber
	su+wU/gHgBab6R+BaRdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQGiR-0000000HHyv-3ksj;
	Mon, 09 Nov 2026 04:10:43 +0000
Received: from va-1-113.ptr.blmpb.com ([209.127.230.113])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQGiP-0000000HHyK-1XSb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 04:10:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794197430; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=mjCS2cccvac/fD96GCgBgLZYurJFuPvJEGsUseQ1xMA=;
 b=aC8oy7DI6AYJdOPYIjJ5L1SoAo8XBW0GiKJbiVFkL6ynnuthgsd4ViFdl2jPLeTDgSDI7l
 S5tHcMa+6CIwR5eAuS05pVy+fAMhIgjE/joHgWSEyXqTrTKr+KLcZEgmYFyWez/O/rtWL/
 F98zXkjhdSODQm6BPhJDcBiqco/40/Zadgai39dRiMB3vJumwp08h5U5ev0ij9Z98xVHnV
 t/jPOQWS8uG3CQZFsf3zpEPbqEfDzlgm6lz8Tg7KPg6ue1JJpx4JaYDnoEpfdKYFt2pgkm
 4Zmv/krkSswaEcIDtPwpHRuZX8e5X9IGwxsA4e0UKABNTVg8M8cS8MLs2GJelA==
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
Date: Mon, 9 Nov 2026 12:10:11 +0800
In-Reply-To: <avDGjYYR6Tj1sVgP@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>
References: <20261105113051.97810-1-zhaogongyi@bytedance.com> <avDGjYYR6Tj1sVgP@redhat.com>
Subject: Re: [PATCH v3] arm64: ptrace: don't warn on missing siginfo in a group-stop
Message-Id: <7fb3d264-ada7-4dfd-be21-05ce370686a0@bytedance.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26af147b5+941717+lists.infradead.org+zhaogongyi@bytedance.com>
User-Agent: Mozilla Thunderbird
To: "Oleg Nesterov" <oleg@redhat.com>
Cc: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>, 
	<ruanjinjie@huawei.com>, <linux-arm-kernel@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_201041_824633_677EE101 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Oleg,

Thanks for the review and Acked-by.

On 11/9/26 2:59 AM, Oleg Nesterov wrote:
> 
> ----------------------------------------------------------------------------
> But can't resist... The old comment was obviously wrong, the new one doesn't
> look clear to me. It correctly explains why info can be NULL, but not why we
> should not update orig_x0 in this case. May be it should just say that exit-stop
> always comes with info != NULL?
> 

You're right: the comment explains why info can be NULL, but not why we
return. The early return is intentional: it keeps orig_x0 unchanged
during a non-seized group-stop. I'll wait for Catalin and Will's 
thoughts on the wording.

Thanks,
Gongyi

