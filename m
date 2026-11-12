Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8AC606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 16:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xtez9jk3;
	dkim=pass (4096-bit key) header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b=f9LFcXvY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=chOtkRmA9LqcH4xpz7Hul5fzkPX+9e1RBVUmRFQ4sbE=; b=xtez9jk3CRAiRs
	NSfW5374ZVOJa4b2oTl8E7qKoQ50o4bSA4UGcwkiaijVlnN7/cBAsQQUedtuLd1aDtVPTLG98CZZV
	J6Ru1RYBXeGcsfwhV5cuo2Aogu43lfUczvEfJ8nAIRlNFLQgZpuS0yYFWFUB2ztdD3ZLvc5IpFVnb
	CynXz+dTAH3lcf4auB5dZqaI2vCLQOe5jbBUpLvtj+6BSifkp7w3ce3HgtNCPU2KXe+OL0HFVSrq9
	cO4/6SkU4SmtFH8+VLaaoNEk7xK3AJO0ntu4xS6t1MbSzg8dX1Z/vici9yTJ6B9e8ZfUnrekO+BLm
	n2JS6rw7Jw0IpNKrUnXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXP1-0000000AYME-3rej;
	Thu, 12 Nov 2026 16:11:55 +0000
Received: from mailgate01.uberspace.is ([95.143.172.20])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXNX-0000000AY55-1Gs0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 16:10:26 +0000
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id E89C1608B1
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 17:10:12 +0100 (CET)
Received: (qmail 9224 invoked by uid 990); 12 Nov 2026 16:10:12 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by devico.uberspace.de (Haraka/3.1.1) with ESMTPSA; Thu, 12 Nov 2026 17:10:12 +0100
Message-ID: <13dd3297-f264-4cfb-b8ac-b05c53d3c820@lausen.nl>
Date: Thu, 12 Nov 2026 17:10:06 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] pmdomain: rockchip: Manage the RK3576 GPU domain
 supply
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: ulfh@kernel.org, heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, detlev.casanova@collabora.com,
 finley.xiao@rock-chips.com, zhangqing@rock-chips.com, inindev@gmail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, gahing@gahingwoo.com
References: <20261019092417.391522-1-leonard@lausen.nl>
 <20261019092417.391522-2-leonard@lausen.nl>
 <CAPx+jO-9BqNgA1Nx2TiHX=BS6cJMmETepYsiujBCeeb3wPt1bQ@mail.gmail.com>
Content-Language: en-US
From: Leonard Lausen <leonard@lausen.nl>
In-Reply-To: <CAPx+jO-9BqNgA1Nx2TiHX=BS6cJMmETepYsiujBCeeb3wPt1bQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: -
X-Rspamd-Report: SUSPICIOUS_RECIPS(1.5) BAYES_HAM(-2.999905) XM_UA_NO_VERSION(0.01) MIME_GOOD(-0.1)
X-Rspamd-Score: -1.589905
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=lausen.nl; s=uberspace;
	h=from:to:cc:subject:date;
	bh=6Bq9skfW1p6CvrhTcRQngnvs1JbfcWRTcyvjApbE79k=;
	b=f9LFcXvYXYLJ6LKsYRYU0/74LbfOdjzkKFjcsco/PWpx9sJwNbRIduzRv26MuDj+gDOcgmh1R2
	lA7YzyvTarn0W8RaqGzE4g0aB5D4K2Ojo0xZ85sk0fRLlME4IeP1Fs1OmwA1JYcUYNNsVnyWAEFN
	sCmj+itYuCK8X7d4Yxc/GB2iw63A7/2Uc/ffpz6pfmfxWkpjBWshuNygy425mCMDTp1to9v1EpVA
	9eXid+2WSfnXEwyB0y53bOX+nlY+QVUHrPCfKxaY0eiHhBnv3GCREEtB9lrLnbj5TKvoY844R91k
	5pLR9f+2akWQxHG6HPUg+x8OL2eWydAIgF1fNYxqiQuQyF3BVl86flWYzFoAZseVKesV8/jWmwXl
	wl0/lAdkYgGLKkzhHiTZActWAqK3flQQLliggPBZAAhqBvlQTcmVzWYXhbH/S+m0W9UFpqlob4hk
	xKdXacopb/lN6944nO+CyTTKQinGvI/lnDqjaq6uSjeV/U32HAv+Z7Jly2mw8zTiVntDM900PHFd
	3xGcix27TEuWKwX0ET6urawGSuGAxRONBshGOKBWN5YQEM6TDsd08pWBrPxPSRKakrX66XzXHUUo
	/bXtrLZGxxsuHxQFL+Sdc9XlGHVu2YgeoZs2zrCMWQBpgtP8x3Uhlm/ZkapxN4Lr4EQeR1xLGHH7
	Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_081023_558157_293BD9E8 
X-CRM114-Status: GOOD (  12.75  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am 12.11.26 um 16:19 schrieb Ulf Hansson:
> On Mon, Oct 19, 2026 at 11:24 AM Leonard Lausen <leonard@lausen.nl> wrote:
>>
>> On the NanoPi M5, boot hangs during Panfrost initialization. Before this
>> fix, booting required blacklisting Panfrost on the kernel command line.
>> Loading Panfrost after boot reports a GPU power-domain acknowledgment
>> timeout:
>>
>>    failed to get ack on domain 'gpu', val=0x113ff
>>
>> Add regulator support to the RK3576 domain descriptors and mark the GPU
>> domain as regulator-dependent. This lets the existing Rockchip
>> power-domain regulator handling manage the GPU domain supply.
>>
>> A corresponding domain-supply property is needed in the board DT.
>>
>> The regulator-capable descriptors are based on the regulator support in
>> Jiaxing Hu's pending RK3576 NPU enablement series, without its NPU settle
>> delay changes.
>>
>> Link: https://lore.kernel.org/all/20260924102135.92217-10-gahing@gahingwoo.com/
>> Fixes: cfee1b507758 ("pmdomain: rockchip: Add support for RK3576 SoC")
>> Signed-off-by: Leonard Lausen <leonard@lausen.nl>
> 
> So this should be applied as a fix and tagged for stable kernels, right?
Hi Uffe,

No concerns on backporting from my side. I was previously running 6.19 
and had to disable panfrost to avoid the boot hang fixed here. I 
validated the fix only on 7.3 however. If you prefer only applying to 
next, it also works for me.

Best regards
Leonard

