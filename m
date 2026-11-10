Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA8F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 22:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PDh8vJrR;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Js6AusJU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h2Zy2VSq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=delInrFccnRDmpD2O0gZtftiyVmvNs6sg+QiUy5od1A=; b=PDh8vJrRq04Qx9
	L8QGe4Eeu7zTNle7pBhMrh84QaXuNsNtiBwv2dfoQCRTeCcpZX7TJ0CymCwk1CyEagY0aLVnzHZfD
	eOlYZ4kaHAH/WNFU6jaqujWNdk95XOPkE99jjR6mrsSM9FEEu/lcAaQh4obYY5da2UiYt+qQCm05g
	2yFlOftXe1Hrfe2Rq4NsyCi7qWzf0p2pa/VU3QyN2n1GBk6as7DnxW1JDEq2FypmBWX38tpBf5E4A
	RLJFGkOCMRzZzrgjB4NfSbf3V8XtQLi3lXlevSgeIsp4+cZ0aWlmCsU+6i+nguyT/kMEysIrkRiNe
	4DWtIqr4rXtUC4wXoEnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQumU-00000005Cs4-0W9m;
	Tue, 10 Nov 2026 22:57:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQumR-00000005CrS-41sX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 22:57:33 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKiJp3592231
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 22:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	delInrFccnRDmpD2O0gZtftiyVmvNs6sg+QiUy5od1A=; b=Js6AusJU1aJqM0Sm
	v85gNtaAorFofzWUIJj7Ha322GvPgEpTIeZVy1T9q4VzD4/LSFGttG0M6DoaGvk6
	0ZHvrN1ExCGzKerskWkckIa2bJKrCw/J57iuco6mbbfZS2DR4xwSQmUJNQwy6ASM
	5dsPklECATLC56/EJd6s2hg+aa7V7DKHOurFeqoV0m3SPrK2H9z6iz0Nu8+7ZyT2
	Co/GBipnC5PRTxKG3gonvMdijBtHI3BZOpJ1K4C5qYn694totCReBFyZ4xZ6Trn1
	EHnvY3KqFjffoFFWFc2vv490UPCKr42SksVLKistVAAVMyMZHmShPQLJt+RQc4cf
	Si6RnQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv7c5hdcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 22:57:30 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375f0fd31f4so1238111eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 14:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794351450; x=1794956250; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=delInrFccnRDmpD2O0gZtftiyVmvNs6sg+QiUy5od1A=;
        b=h2Zy2VSqmKi5bO5l3isYEGx2TGD3ktBNYImJTTSIEWra9aYzXOxVE0e3w5ns6YQNnW
         BC5YdDuSzsJs0bGUeI26yHWndhcbac+LpUE4Iy7VUYzFnsiRCbOze61VvC7J0WOOprOP
         DRKvs5HRzMekNGwu7jelHexLRKmc9ztVeYLKhFHbYerkVet4Fx1MOI6e/Uit4FsyJkWZ
         ZjNbyf53hurECQoReZEIZmf6Z/oMcxt0bUDPIeHy7Ez+F+Ofrd6io8jyg473wSbn2weZ
         FifUsxq6FnTVRA7CP1rR6y/nI8EKla26QxBJia7AI1ZsbdvP9ziSAf6TpAvFSruj61CY
         YMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794351450; x=1794956250;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=delInrFccnRDmpD2O0gZtftiyVmvNs6sg+QiUy5od1A=;
        b=twbqJyEZWilXgwE8yI62RfcaqhmI6R9N4Ha1XamdNfoVzatkjCp/aF4mXlgffq7V1X
         KJDHmpF2YalCs+IhfjceAbKbZT8CkdmlZ7FfBnnB7mGw7NoOq1crYZVkkMbR9kz9V6uu
         QlYwz7n5p5hOFuTEp3q5uU1OILd4v69ZxRpd5j+Pam9HBVj3SuzZoLYeRWRUuNuSa6YD
         6M7xruvhNjrTbOH8tuc3dAk0sUJ4lWbRi5zn6Fj60KOeXvtz0ouIfn2l4NbMVy5qaJUJ
         8bQ8Bob7DZvvx9/ivD0yKF1BQLjTgKvoZMzQIgbx2Y9SSxFCRGGi49/bN1bO53X0bLMl
         4t7w==
X-Forwarded-Encrypted: i=1; AL+hErELYJZHzIYnCsAPL6kGaavRcoocLog5/mGN1wG4yGg27wVIsYCddVgVhONPDsklK1J8mnRDdZBOPuL1iCJpdLMk@lists.infradead.org
X-Gm-Message-State: APuU4Z+BeuXZw89gltosUplPpNdB2d+v1G9Ew0lodE+AfzT90JXuYskX
	MWxtZmzsjRURquA9uMR/x5nPGwJ522jaeigCg3wC9gB0xjuGhL5+9L3VBTLZZ8fIIkffBVMjysN
	rTrI0PLw6LeBIl3VDvz+c3FJLD/0I0KwRVxlNB5Oy19IjiJS2y8bQ/8XjDJDZuQpZaqI4JEHcZe
	WDLQ==
X-Gm-Gg: AYBFou1h1LZz6zya8+kuZuSsPcGh2QuwzZWOhhEFV57oUYt77tZUzJyQsfzcXmXrPct
	jsoZo9cWiVNZbRqcmtnJqwSO3RlhRQSkFcwy9qWhmLJPSqEIZWD8psFDHKC4t3ZU9FF+00KqyYJ
	6JGmTPGvbb7xB9Pt9/x5xhyymj5zZQACr5MiNMvytS+J+FZkVKAtCGKThaD/Xx0oIzw91L+2DO+
	AuleTFdzy+xoD1xoxpZQp+jGHKNFVx0meA462fmPJxJ3pIfC8Uvcv/9DBrAJX/cgKdk6Pyv03gz
	jcLrDE9Kbm6XxXu/wC6fgBukHEQz/tUrCa5k+dkZ+pAFJ6u4qSowLf/fsDZnKH5jdZGiPR9I/8J
	LlGdyfPqpsCmB+1uFNlULL41m0/E3XjoWbaH1htWGo6Hq3GNOCb8Ta/tLOKDYBEGD8BL1t4wx27
	n0z5lX99h5bo2ge/HlTKTeGXWtZcM=
X-Received: by 2002:a05:693c:66d3:20b0:35e:f1a5:9ba6 with SMTP id 5a478bee46e88-37683188881mr1061674eec.5.1794351449633;
        Tue, 10 Nov 2026 14:57:29 -0800 (PST)
X-Received: by 2002:a05:693c:66d3:20b0:35e:f1a5:9ba6 with SMTP id 5a478bee46e88-37683188881mr1061633eec.5.1794351449088;
        Tue, 10 Nov 2026 14:57:29 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060dc0csm11561398eec.14.2026.11.10.14.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:57:28 -0800 (PST)
Date: Tue, 10 Nov 2026 14:57:11 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 27/35] firmware: arm_scmi: Expose per-instance
 identifier
Message-ID: <20261110145711.00002217@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-28-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-28-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA5MSBTYWx0ZWRfX6YquQlOMR6ge
 Ll9xp4FvLKbQaB5FBj4oCxPYqj7GPxAH1wwPFs3MH7pY1olOt9aFcrzjacRfjDQYhXEcMzwbVWA
 om8a9XH1jvZGI0veHpXtvgryxeVVoKDsCG6/DuN/k0yj87XLUiImUegt2FFf1SR6H96WHuq/F49
 HTv8Jh/QCUjdKhAVsovb0J3969Z/pe0vD/DPeqM4SgP9mbADdcRMiEZEhdClxZPPbo2e0AZY5D0
 xM2NtZLufnnY52avAgvY5ahm1v0h92jjiGwNr2FmFzEwRR6ARU0gEAI3MJlzWVjFMx0ncQJaMYV
 D30jA+g6ITnMnf/iuC7EizPPWInmQXtoY1Qm9pzKPC15tGcHR46RmoocNqHHxLfLoq4Aw229HMG
 KN3FWM8pefjdtUPCoCfokri18ADkVYC5PnvaTLgDT595OBlX3jyp8nSXzf7Q8x+cD9FOXOPIfm/
 d9/bgwuNGdQVroBqmPQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA5MSBTYWx0ZWRfXzFzQjMnS7a0G
 xxnaRWFB+atdyAzRCWO+Q9ekYWodnVo+il4iTweq9HB4zXLCINQ78qAlhi1wyAALleA2ISad8F7
 jtZwbIxZxaXU4T1aadi0Fa3ev7KMP/g=
X-Proofpoint-ORIG-GUID: kgQ4adaawOFQ94QQOUhJMF0IKbbA2ZYO
X-Authority-Analysis: v=2.4 cv=eq9KXYpX c=1 sm=1 tr=0 ts=6af3a15a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=P0Bfr-jsjiM-HyT3fQwA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: kgQ4adaawOFQ94QQOUhJMF0IKbbA2ZYO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_145732_122419_0C8DFFB4 
X-CRM114-Status: GOOD (  13.56  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon,  9 Nov 2026 09:12:13 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> When multiple SCMI instances are configured, the SCMI stack probes and
> it is initialized multiple times: one core stack for each defined instance.
> 
> Each istance is simply identified internally with a number and such number
> is already exposed to the user to name the root of the per-instance debugfs
> subtree, if enabled.
> 
> Expose such unique identifier to the SCMI drivers so that they can use
> that same identifier when in need to name their per-instance resources.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

