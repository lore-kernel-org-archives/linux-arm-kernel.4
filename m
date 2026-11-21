Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B415606A6AF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 00:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OtPlzfU/;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QEXaY4Tg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DC4qMj0H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6bbaPssp2aMlgmcypJoOLAro7xCV2VNSDqC5DV2L0pA=; b=OtPlzfU/fyP98l
	K74t5TuimtQgDVQ8XZJYW/tM7fS8RWp5h6SjomYxa5Y5tF+FuPyGmIxfv2b9sfO5/U1nC8lJBqja4
	IRazQjFyoLFLZBb6ZGL9oMyN0vy7FqKjFUP4o4AvwMOrcsHMg8d+o0OBLEvJYzAcZmEeS9xsFzvSD
	xkubU+Hu0Oc5pf2SdrJ2HaP1dSx2axZIzALYuSRIrW8jc4WQebDZysIyMh+DRFwP6h0r26E6S+2QG
	DhtWrj3/BaZucIPkQa/3fGqlwO2jWQ6OnOwh/7rSRHiKQlhAYt0o/a11llZUQFBW+6po+MkO7cARA
	/XEb2qe36RbTEdzNFg9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZDK-0000000GXou-0jx0;
	Sat, 21 Nov 2026 00:44:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZDH-0000000GXoX-1cTS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 00:44:20 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AL0CgvX663644
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 00:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6bbaPssp2aMlgmcypJoOLAro7xCV2VNSDqC5DV2L0pA=; b=QEXaY4TgrqclYeUG
	E4U3L6SY4ofnwsAYJHj/1j44DLSySxjEkq8E10NchzmXvmkdTzi3itIkDLr9BFmg
	DdhPUBwDW3fqkTp+JHB77K7X8PSurKwy9/KdcyQEmcHErDcJYdS40+X0rSSf7ukO
	8WA0y8jtPdTKauky4CIpkQcSqhWTKVE4Bje6FpGzf1qwPipQTPGFdpRmRRI1wIw0
	mS2idhhFwBKArx4g1YVrlssKLd6pl7iSBNoXie+LR6VuNCfrw6+r0HG8VhDm2+yb
	a2k9ieYhV5hLLWXX6uMGmxvdME/vpecVUhBhx2gtJd1X81nM+Nww2fuemP1o330U
	WsIspg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2sjwhs5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 00:44:17 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1905292eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 16:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795221857; x=1795826657; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6bbaPssp2aMlgmcypJoOLAro7xCV2VNSDqC5DV2L0pA=;
        b=DC4qMj0HmvaxqYy0Z/kOwMs+Kzc7sey7s7QoTi/nmkJ/Wy4DtUYUBUb4PN49/HQ0PS
         bScTVaCuBih5l5Q9Yscf7nGRW6FCuHccZTlUB/7G4s49L9KNfnlv3D4D1JERtl93+IZi
         jL7cWn1Aka/xYxN5aX0Np6G8boYVTbRyLemPpOOnsxLyqzUvc5g+HVUh0FufI+JMhn5A
         R4I8Uw+wo50gGru8FIQuDnXql8sWNNkqNLTKvPSk1jL+GfcGKCRPP0eZGFsowwhnQRMj
         p7eKdDA54qbbobs3ru9byrxKU1sIQIKQf+jg0kseQKWF5Uh5IIqpA1PEQQRyCWFPGD/B
         GjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795221857; x=1795826657;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6bbaPssp2aMlgmcypJoOLAro7xCV2VNSDqC5DV2L0pA=;
        b=xExB54fKm/mlk9dC6a6zj4Q+JP8CSqABD/hTNDjR+lnObvjZHHSkcu7fe739qwywcg
         8Sv13w36+zMnTcW6ZOFYrHJ9qDJ04sZuwI5CyNGrvzrU72U0kLyVIoeYKpN6pjE34Ivd
         ERQ0jRGqgggiVX9fohW3O+q8Sv9VN7nZCNu8z9w7MxO/nEgHK9B36vzTIDuVaaaD61PD
         dA9mXU6fxM6q0AsZImx+TbVpicJvdH+O8YwIhYsOHZjjvcpheQXtb0yRTKQCJTtrBYx2
         +tg5cYl9VeLYD/rEgFAaPASwoNhGJrzh9frmOfA8z1BGX7Wrsv1+Jm0zTXL2JL5fUDaU
         RqNw==
X-Forwarded-Encrypted: i=1; AL+hErHSN/f8t9j76gm/jeAsnaYipR3Ve53ZuKr+SRsrvW36JlB4CKFI7hj+R+78Mu7l7nr0Ik6TOTz921XSvRBBqBxR@lists.infradead.org
X-Gm-Message-State: APuU4Z8RbVmLGV5aZnr6B9N+EX1t/ckLDyI4puZHZOObLxyGhN0IYiQZ
	Y1gh6JQDdHCLRNLcEt5Dk+68fWqGX6FGRNk/tQgZlkbn/e1qJVQHS7anmVTvY8Fkx34+9ZrJrOt
	PsnBVNE4UWjSKlhqwCxMu9oMcaBz+PRVgiIigg6yEap86b2mDlG907ZpoRNp/8ZXhD9sWYtfUiS
	buHQ==
X-Gm-Gg: AZFdTZc5EagtdyQ8U2wx1qruELaFkSYmmkBoAfDbUgWQjX5brZq2QK8UB7x1DTG/U4S
	e7ar17ILVTB/wl92aiT8SMyT/4gT8NGE+CQ2waHU3zQUtq0vwwRzyz9COr5EZs3Ca1fb2m8alUP
	Ecy8MgH76i6X2Z4fHoywec2yl4IdNOJYJsKTF+tCmUs5RITIGmml+EOsl6fvC5jTGO/6BV+21BC
	EYcohqkFVcVbOqSwf/HwHrSP8x1CsQXBraiwi4tOUs2Vv3SAufPctHQBCtVidScHdnzz4OdaBS9
	ToEOtaararp348ZTg2852t+ag241ACn8i4j/KfWVs0TJVMF+6PbZu03IuJLChGwT2/8kC9sXDUu
	6dAp0t5d/jpJQysMok4oVnAulyn8V7Jz6u9HGMFWnOpk65B8uEFgMR6YGnD/cJ6XjIEbD6u0YRy
	3NkexRdnck/6e00cPxYAwbpWpeAlQwaLXG+43iTqm7Mo36PyA3yHRgIla8/w==
X-Received: by 2002:a05:693c:6010:b0:385:2057:eb95 with SMTP id 5a478bee46e88-3857073f2a3mr5777417eec.31.1795221856790;
        Fri, 20 Nov 2026 16:44:16 -0800 (PST)
X-Received: by 2002:a05:693c:6010:b0:385:2057:eb95 with SMTP id 5a478bee46e88-3857073f2a3mr5777357eec.31.1795221856211;
        Fri, 20 Nov 2026 16:44:16 -0800 (PST)
Received: from [192.168.1.72] (108-202-119-98.lightspeed.frokca.sbcglobal.net. [108.202.119.98])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm12974717eec.28.2026.11.20.16.44.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 16:44:15 -0800 (PST)
Message-ID: <13d32bf7-7f74-4dc5-a875-671167149df9@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:44:15 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/4] firmware: arm: Add Platform Fault Detection
 Interface support
To: Ahmed Azeem <ahmed.azeem@arm.com>, linux-arm-kernel@lists.infradead.org,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-api@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Divin Raj <divin.raj@arm.com>,
        Bertrand Marquis <Bertrand.Marquis@arm.com>,
        Ashok Raj <ashok.raj@oss.qualcomm.com>, punita@qti.qualcomm.com,
        jonathan.cameron@oss.qualcomm.com
References: <20261119-topics-ahmaze01-upstream-pfdi-rfc-v1-0-4772d18b9115@arm.com>
Content-Language: en-US
From: Jithu Joseph <jithu.joseph@oss.qualcomm.com>
In-Reply-To: <20261119-topics-ahmaze01-upstream-pfdi-rfc-v1-0-4772d18b9115@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iWLnrUPCH9gXQWZRuqZuMFpTNqZLsG0y
X-Proofpoint-GUID: iWLnrUPCH9gXQWZRuqZuMFpTNqZLsG0y
X-Authority-Analysis: v=2.4 cv=dZ4VTnXe c=1 sm=1 tr=0 ts=6b00e961 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=HIR1veyihGOKDQ4ymPDRgQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=9AdMxfjQAAAA:20 a=VwQbUJbxAAAA:8 a=oK97o0Sx6ny3NbBOOE0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDAwMSBTYWx0ZWRfX1KDyLr0uAdTD
 hPCl1AMA9DS04DqcwrNnlT+Q/pITeTQy/SKwuYPaP2BLSlb3cD438qHTjCDE2FHMaHPTDr60rtl
 KRIZKob5rd6bFdVmZOtmj4ND2fZ6ng4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDAwMSBTYWx0ZWRfXyPx92PjgAECl
 0wBN26/Hy1Wg13JO/bm3gmrk57o4Mwl4zIiNyhA9h0y+LHZI5pzpHExgUZ6cAQVvKbHMI9wxNHX
 dBult9ZWJyIesPEQxNH/o0jDxPCQJ4sQ1KcE/HwcsK1p+obTH+T6v1UplaH94I1UscTm9yHPxmM
 KPHZZ9RWTmpaYUOgf595/6zH+EysS5EEMgce97oUMLwWRBvInwAVqP7OwNQvOyqZD9QmD585wcS
 ihLgznT4YDcfYVRfm6gUUSYVN2bo+RWwyn7v9WsPCd1CARDikRpElWhWHlAOGiqWQ1NIyknkJxq
 jjnw8EO+p7Z6NE64UlFz1caSYyOV/Px7716bqqEzBn0Mb7nMF3dNx+8xvE81K4VaCkL9lErvHCK
 qMPzMu/JZa7Z+4i9IG6M/rBW4wevs66GmR3oLMLblo6LOAgqhViIT4EfJlCu19UQulbqZ8HCkB4
 pX3xqmvb36BdobGEKjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611210001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_164419_569726_870A94B2 
X-CRM114-Status: GOOD (  24.58  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/19/2026 7:36 AM, Ahmed Azeem wrote:
> Hi all,
> 
> This series proposes an arm64 driver for the Arm Platform Fault
> Detection
> Interface (PFDI), providing a common Linux interface for privileged
> userspace to discover and invoke firmware diagnostics.
> 
> We are posting this series as an RFC to seek community feedback on both
> the proposed Linux interface and the underlying firmware specification
> before the specification is finalized. This series and its validation
> use
> the PFDI 1.0 ALP0 specification [1]. The current public revision is PFDI
> 1.0 BET0 [2]. Feedback on the software integration will help identify
> any
> changes needed to align an upstream implementation with the evolving
> specification.
>
 
...

> 
> I would appreciate feedback on the specification's suitability for Linux
> integration, the proposed per-CPU ioctl ABI, the worker and hotplug
> model,
> and whether this belongs under drivers/firmware. In particular, is this
> the right scope for a common PFDI interface, and should error injection
> be exposed separately from normal diagnostic operations?
> 

Thanks for the RFC

I haven't read through the specs or code in great detail, but I thought I would send in my initial thoughts

Most of it comes from my experience developing/up-streaming a similar feature in my prior job at Intel called In Field Scan [1] / [2]. 

I think creating per-cpu threads just for this feature might be an overkill on a system with large core-counts. I think an alternate approach like below might work for this 

1. Drop the per-CPU kthreads and the cpuhp state; run each request on the target CPU when it arrives ... something like
cpus_read_lock();
if (!cpu_online(cpu) 
        ret = -ENODEV;
else
        ret = work_on_cpu(cpu, pfdi_op_fn, &req);   /* or smp_call_on_cpu() */
 cpus_read_unlock();

(IFS used an alternate cpu stopper mechanism as it had the additional responsibility of synchronizing sibling threads and related timing etc ... it might not be needed here )

2. Use one device with the CPU passed in the request, not <numcpu> device nodes. Use a single /dev/pfdi (or /dev/cpu_pfdi) and add a cpu field to each ioctl argument struct. That removes:
- the per-CPU miscdevice and pfdi_dev_data
- the per-CPU register/deregister on hotplug etc

(I will be away next week ...so my responses will be delayed)

[1] https://github.com/torvalds/linux/blob/master/drivers/platform/x86/intel/ifs/ifs.h
[2] https://www.kernel.org/doc/html/latest/arch/x86/ifs.html


Thanks
Jithu

