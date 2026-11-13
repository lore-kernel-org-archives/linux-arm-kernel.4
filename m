Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D65F606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 05:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KSJG6m0I;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=Hb6WZoyW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rPzEgBE106yaQqByyeXscMcg7AQKZ3fm1kcWw+tpiss=; b=KSJG6m0Is70XlkRv5FuGjpZDln
	TTC59dzvHEAQEx2quQNl1LQp5TEbCPCUvt0uaozf8yebM/qTf/0UsihdJvbP60MGLdZZjpR/Tnm2y
	CDc8dzQ/GmQ1efMxbwnrMUB8RNDVn4hKmRU5xRQQzHeTE4cqja7auALXpsG/fs6ibPAMWlqZCqlQX
	M5VZkR05oa6giExBMeDplRiTA+HpXEl3iYI8ZqqOD11ZciRdJsFdv2ZiwSKDcMH25/+dyq2zMAWzI
	A9ose6oYYo6wpv5Hqujg5sakJKkTpFgdjw5M6aHII+DwHnT8WNZeIhRSZktuNngTtatlmq6/2O2Ri
	jrU9kShw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRk7g-0000000BiWF-3rQo;
	Fri, 13 Nov 2026 05:46:52 +0000
Received: from sender-op-o17.zoho.eu ([136.143.169.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRk7e-0000000BiVg-2LdF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 05:46:52 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794548803; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=EcgdRAIhrL6M22CtxlBH6d1xOWnTZzSQ3LEcA0MzcFsgo42VCIRZof9KZFR2b8yV3qalkZ4KUw68LPa64HsJiGVNww991k14pPkZ4MGb2b9M+hwL2lycM53VFn9ZjrJyd0Cf2Dhdoq6ZgrhcqXrIAYBxt/Q3+uWi9CRDT1kGPI8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1794548803; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rPzEgBE106yaQqByyeXscMcg7AQKZ3fm1kcWw+tpiss=; 
	b=fRZ+VFkfojqAVIJtTyev52eNh3A9330xPG0HyptKd9RfNwInNobJqruvoz5aWwvOeIIkIHmbv0UmblJgMcrPa6MT5io5WyPwDmdezKI452C1k2jEdf7hnzh+t75nQKMsmVfBw0rBX92Kvz8tvKI4bfE1rscG8SFJMBNKD/r0kGE=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=Hb6WZoyW3Q0tgRjIK+xSk6Q6TGfttfabmRur6SiMGcVhe+xqauo7mvRB/nQuNOUU95LM0+1kXc5SK4oV7O7cxn0/n0Jmtol3VfVtupLmQyMDYNUCc9HWn94KSQpC/+zHXIl+CIcqs3mWuok/RntMUuhmhN+IuhgtYrfK1sQQ4JQ=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=rPzEgBE106yaQqByyeXscMcg7AQKZ3fm1kcWw+tpiss=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 17945488025851002.7582991725606;
	Fri, 13 Nov 2026 06:46:42 +0100 (CET)
Date: Fri, 13 Nov 2026 07:46:41 +0200
From: Igor Velkov <iav@iav.lv>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Igor Velkov <iav@iav.lv>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: coresight: cpu-debug: PC sampling via PMPCSR (FEAT_PCSRv8p2)?
Message-ID: <20261113-coresight-pmpcsr-question-1@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_214650_879894_1BAEE346 
X-CRM114-Status: UNSURE (   7.01  )
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

Hi,

Cortex-A55 (Amlogic S905X3) reports EDDEVID.PCSample = 0, so
coresight-cpu-debug cannot use it. The PC is available through PMPCSR
in the external PMU frame (debug frame + 0x20000, PMDEVID.PCSample = 1).
A lab module reading PMPCSR caught the PC of a CPU stuck on a PCIe bus
access with IRQs off; on this GICv2 SoC the stop IPI never reaches it.

Two observations:
- A panic notifier samples too late: the other CPUs are stopped by
  then, and on this SoC reading the PMU frame of a stopped CPU raises a
  synchronous external abort. Sampling on entry to smp_send_stop()
  works.
- Marvell has an out-of-tree patch, "coresight: cpu-debug: Add support
  to dump PMPCSR" (2023, carried in linux-yocto); I could not find it
  on the lists.

Is PMPCSR support in coresight-cpu-debug planned or welcome? And how
should such a PMU frame be described in DT: arm,coresight-cpu-debug or
a new compatible?

Thanks,
Igor

