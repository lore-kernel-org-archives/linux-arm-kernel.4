Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C2C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 03:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G8rgnPo6;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=mAJk9qXe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uMTNYUkii6qLQJ9ZEEqnYSkjnjc4c5VnVsIGkdlEd14=; b=G8rgnPo6pmoHmA
	TF6+TeD7Fb0krmQoYpl7lIC8JRk8M4QR6edO3o9CFSX9/YmwxjbCZAlo79JZvFlpWtkR2L0Lq66ON
	4ZgrYfhZzXqj12gZL93Aj1zxP/3CFav2jkFJ5bn0XG2LZjw2PXIV0g48Wm+tpdT7X+IzzV5Hk+dc5
	dYowgG9A3lPrGDrUD5KcqX9iMliq6w0It/b/lW76/qP9YKQsFbv1MZDzMz0yEBD7ZAbcWoLX9Z5lP
	TR9M+NyS3vgx0uy+8UMLhYfbC3+amHQADTzoGw2tfupax8SR0mIm5kb9AmlGVaHpPV21s2yVqDMDR
	q0V3yCcyjM6j+dvG6h2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQyej-00000005Uge-3nsU;
	Wed, 11 Nov 2026 03:05:49 +0000
Received: from mail-24418.protonmail.ch ([109.224.244.18])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQyed-00000005Ufy-2v5k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 03:05:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794366339; x=1794625539;
	bh=uMTNYUkii6qLQJ9ZEEqnYSkjnjc4c5VnVsIGkdlEd14=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=mAJk9qXef5Dg92eNFgL1RRe5OnKLf1i0HsXA+8ARikr6+LWggcz8YnnZ0V5PncB/t
	 Ojz8P7QUm+rYOjpXVaXOBSXbULCSXHtp8DZFqLMZ/sQenvK1IonhyF3/cUdqIAnvVS
	 8+O+JPUmuhPnDxxe9oBKZbhEKkEh6+v1bVQ8UHsG6ur5t0UsRPKiTHkYNxRTlBxC/p
	 TtePKLvBY0Bu+YbefdTscuwyWQmglSmWFHFbiaQUptV8Qn+zHzGG1TqazMQQ5t2wqT
	 0ZAm0lJWuakoyuB2b8ydv+poW7XTlRIthyO3ZgNh1VVTu78b/8C0BsFhvM/OMGW5Y/
	 d25vK0KqGLdwA==
Date: Wed, 11 Nov 2026 03:05:33 +0000
To: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>
From: Birk Skyum <birk.skyum@pm.me>
Cc: sudeep.holla@kernel.org, cristian.marussi@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, myungjoo.ham@samsung.com, kyungmin.park@samsung.com, cw00.choi@samsung.com, digetx@gmail.com, thierry.reding@kernel.org, jonathanh@nvidia.com, andersson@kernel.org, konradybcio@kernel.org, rajendra.nayak@oss.qualcomm.com, pankaj.patil@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH RFC 09/10] arm64: dts: qcom: hamoa: Enable LLCC/DDR/DDR_QOS DVFS
Message-ID: <179436632843.48104.13255943696510307622@pm.me>
In-Reply-To: <20260724-rfc_v8_scmi_memlat-v1-9-cb732bcff1f4@oss.qualcomm.com>
References: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com> <20260724-rfc_v8_scmi_memlat-v1-9-cb732bcff1f4@oss.qualcomm.com>
Feedback-ID: 21326998:user:proton
X-Pm-Message-ID: 4df2f6e52051d98663eb4d196577dc26e996a70d
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_190543_889848_8DD936A4 
X-CRM114-Status: GOOD (  10.61  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Pragnesh, Sibi,

I tried this on a Lenovo Yoga Slim 7x (X1E80100, 83ED, firmware
NHCN62WW) running 7.3 with patches 1-8 of this series and the
protocol@80 node from this patch added to the board's DTB.

Memlat probes, and the ddr, llcc and ddr-qos devfreq devices come up
under the remote governor. CPU read bandwidth goes from about 51 GB/s
to 117 GB/s with six threads, and suspend and resume work.

Under GPU load it isn't stable here, though. I ran Speedometer 3.1 in
Chrome twice with memlat active:

- The first time the run finished, but after a warm reboot into a
  kernel whose DTB lacks protocol@80, the GPU never came up:

  adreno_gmu 3d6a000.gmu: [drm:a6xx_hfi_wait_for_msg_interrupt [msm]] *ERRO=
R* Message HFI_H2F_MSG_GX_BW_PERF_VOTE id 34 timed out waiting for response
  adreno_gmu 3d6a000.gmu: [drm:a6xx_gmu_set_oob [msm]] *ERROR* Timeout wait=
ing for GMU OOB set GPU_SET: 0x4

  A cold boot of the same kernel was fine.

- The second time the machine reset partway through the run, with
  nothing in pstore.

Four runs without the GPU load (a CPU bandwidth test, with and without
a suspend), each followed by the same warm reboot, were clean, as were
about ten boots without memlat.

Separately, the memlat driver sends MEMLAT_STOP_TIMER only from its
.remove callback, and the SCMI bus has no shutdown hook, so on a
reboot the monitors keep running on the CPUCP into whatever boots
next. That would fit the first failure if the GMU's GX bandwidth votes
and the CPUCP's DDR votes get in each other's way. Would it make sense
to stop the timers from a reboot notifier as well?

I'm happy to test a follow-up on this machine.

Thanks,
Birk


