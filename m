Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066EA606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 18:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NskAsrds;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=S/LaEm+5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:References:In-Reply-To:Message-ID:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pFS+nBD9sanXCECu3YWj368bBX/RcwxQ9++pZ15QXJ4=; b=NskAsrds8a8RYN
	eJlc4ov7BP7c6z+8cim6GCdmvmAlDJbxvOWuW+c0PMFRYhRUBJgz4XJqFkLw0ICd5tmcGSCihzDny
	29F0iKShkJuxdbN7lH5Rx8fYJHz609znqMDBiktxkG1k75RlewdvJDOst2I3UY1e4NZmzdjFPXE+W
	KLIHEoUt0kB9EC49nPIQF9qHOZpKdE5g7CcPrwt+MAlJ+T4UhGOJnheaKkb56D6di6lG7+Sttn1+A
	EkvXf+eT0varisTcBbF3OL7q5uYXYWBkv+/iNxnZ6Zf7p8qgLhAQRwf61ZHCPw10cRastgkpTwxeW
	ZTAVp3J1dA9Dfd040ETQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTksf-0000000A36n-1CVj;
	Wed, 18 Nov 2026 18:59:41 +0000
Received: from sender-op-o15.zoho.eu ([136.143.169.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTksb-0000000A35y-1c7S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 18:59:40 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795028370; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=gAzs4acDJmZWCvaGMH7ForsjMZcSZ86+fZWelwCzhXjxhksjhvTABB2sGrLTPef8mrg/+gjSKQ1UsP7yd9yFMBAAhYJu1YICffXmApm/g4VuU9xEzzEug2TTR5ClC44wSyIX+kGeoLPXg0wnbovwKsACem4yI13/Zw/ExPwmoPU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1795028370; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pFS+nBD9sanXCECu3YWj368bBX/RcwxQ9++pZ15QXJ4=; 
	b=G0fhwrnkSkGPPIjKgnDONxSZVaQOFb9/450GkfnjtDC6MKAqr3/H6H2cFw62lsyDZDmqiLhmAaFMGKQk+GIM45nTtZAB/Qn3b8Ycd9coFDfjlQoO7HWhLp2CYFw7jTcI7gHkVW9po8yfatb2I9StypPlwadw8j9PjHsHFlMGdZI=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=S/LaEm+5wmGEvGq+Eqxn/P4uDe9gm7Iu3lLMyK6u0ein4LMUsq8vd9YtKNm4quzliaaMeiyq5xALGGh4zoPbazKlD5MiePA8XbVGDxfmx2duMku2WhiFT0CIm8gcMtyOytyBqx9NdmzPemJ6irAfD1plrjq9wqnH2z/Z2prpaJQ=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=pFS+nBD9sanXCECu3YWj368bBX/RcwxQ9++pZ15QXJ4=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1795028368251225.68583935031825;
	Wed, 18 Nov 2026 19:59:28 +0100 (CET)
From: Igor Velkov <iav@iav.lv>
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: coresight: cpu-debug: PC sampling via PMPCSR (FEAT_PCSRv8p2)?
Message-ID: <20261118-coresight-pmpcsr-reply-leo-3@iav.lv>
In-Reply-To: <20261118104917.GW9176@e132581.arm.com>
References: <20261113-coresight-pmpcsr-question-1@iav.lv>
 <20261113144623.GQ9176@e132581.arm.com>
 <20261114-coresight-pmpcsr-reply-leo-1@iav.lv>
 <20261117183241.GV9176@e132581.arm.com>
 <20261117-coresight-pmpcsr-reply-leo-2@iav.lv>
 <20261118104917.GW9176@e132581.arm.com>
Date: Wed, 18 Nov 2026 20:58:26 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_105937_752706_E63DE035 
X-CRM114-Status: UNSURE (   5.88  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 10:49:17AM +0000, Leo Yan wrote:
>  1) If idle_cpu(cpu) == 0, sample the CPU directly.
>  2) If idle_cpu(cpu) == 1, follow the existing flow to request
>     power-up before sampling.

I tried step 2 on RK3399 (Cortex-A53 + A72, cpuidle with core
powerdown), following debug_read_regs() on a running system:

- Idle A53 (EDPRSR.PU = 0): the EDOSLAR write raises an SError on the
  reading CPU. COREPURQ brings the core up only for a moment; with
  COREPURQ | CORENPDRQ it is off again within 10 ms, and the write
  still faults.
- Idle A72 (PU = 1, R = 1): the same SError on the EDOSLAR write.
- Busy CPUs (idle_cpu() == 0) on both clusters: no errors, full PC.

So on this SoC only step 1 is safe.

Thanks,
Igor

