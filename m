Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D2C606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 21:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xrzfGffP;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SWGQudK9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jxplAjbV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZeMxHXnCBkE76aNWIiCzfKnISExLlSlffb4po3vqmdI=; b=xrzfGffPLeh1W4
	N941279aj04rD8cd3xPfjDxVPthPmeByT5v7pb39Fh0mcswV2ZqlrZ3Um+Np/yE2HtVae4w9fWldR
	00HZM7FUgoz4J5I5PwFDnOhgEDQ8IGKujzZZvU0xATgkhSbLAyZQ5e7km7L9KGYK+agD/dfnKE/Ru
	fBSKbTNsvWliTbkEOqOacFQkUXbrYSXE+Pl0E2Fltno0gRkmFqAldYo9pqXdro3Bsy/FRxPa5C/Th
	VgOb6o0RJ21bX6Z08DmoHApYv+0+n9sCvjzPcDHQk8BUn0j8vsqRvDLxP4EN98Qw1zH+eanvI5O8w
	j3hp/lqfzFDZBS7Xg50g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRcag-0000000B7nm-0qFc;
	Thu, 12 Nov 2026 21:44:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRcad-0000000B7nD-1eYF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 21:44:16 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACJZS2t1690511
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 21:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZeMxHXnCBkE76aNWIiCzfKnISExLlSlffb4po3vqmdI=; b=SWGQudK9aYrpfeUe
	qRTs6vz+IblA+g6HLzEh+HNTp1JWnELbXeYXlgSZ4D2fPe+3AlgY0nfJCmojVecr
	C+1aHyfw3yXogZgwWvUmpNvISQm8rSXicGpc0601ymsG3vVC0nnNzwu95tt4+vCs
	Bcbxjn6HZZ1X+cJSRElTcFVnvSQtwtYku8TUD74ZDphUWF3awQLaBdGsgW4AyT6G
	W7qzXHipUPiDrXYSvquV31srFzv4S58RZ78Y7ViWJZJBenOG9EhrEswCtIA4dsCW
	+blKhYiBYZZmgIcAWEdkgIczvQxR8YKz9apSBUid1wHdMvLOpVaKFGoUNnLABD8m
	RzxBcw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgw8dej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 21:44:14 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3b45597c7so402818c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 13:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794519853; x=1795124653; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZeMxHXnCBkE76aNWIiCzfKnISExLlSlffb4po3vqmdI=;
        b=jxplAjbVzydJ/Hu1gXd2C/ilXx4JnIvZNJxtZkxx/obF0rXl1GJM6GM0/EpBi123kp
         knpU1ZcwvaB8SsDnNsQNGRPCjMoxkqtpfmUgPDenjRXYyEEuEWRjSthdu6hST4uWEhjv
         8Z5/Vah7sooSB2gwLRJhUELSe2VIOv7jTm6bagaWYc4iKINL5TZF78+brCljoFHlA7ZB
         ONWbfk8fAUFf1iRsTWCv0jPMhN2xqMg8L/pcPVBsX58xoSqtEnH40jLa/9SsOq6tFLbJ
         TQvaRCmMHXoRYr0htJVJtjfzhixUsgG1+iwHO3Fvjg9bqHqvVF52vN+wYI1WxEk94yxD
         vSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794519853; x=1795124653;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZeMxHXnCBkE76aNWIiCzfKnISExLlSlffb4po3vqmdI=;
        b=V8pLGFbz4g69jy8QvpqiRajo6cnxRqUJu3hzYkIILHnvUuW05g7TWROUb7OgtloBiD
         g1Lq3GRtXbnd2kKBcbWSVcamwHXBMIHfHL1RE2sIhccVGn8Ne3BdhbE6C1zjtanWSPe7
         I2dF6MD25QKMx85pS/AQB4L+g9eV1Cak+Z9YVsFLXJmkaN4uVBur4HWbm8drwAdKbzfO
         exX0iHPAD7Hz5ZXhAiOdw2RnN8U50RdbtdQ2ZmMdKBwG56vlE5LrGnF8Xm295roqmBcm
         meiAB4lGSP+EeS0wlIf6dOVP1Vw116QyU3fFyEj3LuGaiufBx6QiTwE41ZaeyzD6qjG+
         r5EA==
X-Forwarded-Encrypted: i=1; AL+hErGbe1emABfITiiiQPYzmdux3glvsDiaU0qzIZTbES55uqVRnA9mhKdxmRDAZQMqGGl7Vvj2ojyWfIhjYltsy1gr@lists.infradead.org
X-Gm-Message-State: APuU4Z8uR9+ue0aX0/+bW71uJozyuTBwn3cAXMb7hBnWCnJz5sFESAjl
	runaaQk+oIf9ufsCbHzXDoIC3f+ByAoMDg7GiEEN1bEz4L0H3XzUW9TZv0WIEuYbLIgKgYZLoU9
	5VfnjOVkKQEO9b0BvHd58gHyTQcdd8qnMmJW+rElTdXwy/rU2jOkqe3pi/pT5d1TppWsd3VOSfp
	/nAw==
X-Gm-Gg: AYBFou0MDVtwjpgpStw3eQo9JKyPtEWRpli/3Lx0kqR4IxQQQ/sdD0rw21h2agWVHAd
	IDqNj2HpdUTk930VlA62/Fi8iz8IXEvFI6wGMDFZmv0SvcaxSzuxtlcONEcV09RhH2yeFiuoL7L
	PgMZ9kxIK6lw1uvBS5us8IOu9l+pjgGyJ8dA8L4YXpK0QTC0CYSTrLoVbSpbj73tvlBAhnfQu2n
	c3H2N3DIN+riTyTbmKYe6xwks7bUDy8UFjW6QYLboCLV7eUMnDG6Z+Fm3FNqZ9+5wKO4qdyzhSM
	57jNPVyu4FPr0629HOeTF+tguU7+0BtAdCHdeABhWZhKL2ZWKVJ+xbA1kfGNyxGV7ymf5upxdV7
	c2oT3fM53auRgrvpApBm6HR0zjtuLsNqDlSetOxCBllZ4NTKct5KuVdQiJMNoRD8veuwfG2e5Fk
	xBPhvMtJNNgnyJzjOjpWwtWUyOqwI=
X-Received: by 2002:a05:701b:450d:20b0:181:ccdd:ed2a with SMTP id a92af1059eb24-1b50315f88bmr668914c88.43.1794519853017;
        Thu, 12 Nov 2026 13:44:13 -0800 (PST)
X-Received: by 2002:a05:701b:450d:20b0:181:ccdd:ed2a with SMTP id a92af1059eb24-1b50315f88bmr668878c88.43.1794519852364;
        Thu, 12 Nov 2026 13:44:12 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319e381sm1541771c88.12.2026.11.12.13.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 13:44:12 -0800 (PST)
Date: Thu, 12 Nov 2026 13:44:07 -0800
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
Subject: Re: [PATCH v15 23/35] firmware: arm_scmi: Add Telemetry generation
 counter event
Message-ID: <20261112134407.0000457f@oss.qualcomm.com>
In-Reply-To: <avYe37QP4Upvp51c@pluto>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-24-cristian.marussi@arm.com>
	<20261110144635.00005964@oss.qualcomm.com>
	<avYe37QP4Upvp51c@pluto>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af6332e cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7CQSdrXTAAAA:8 a=reF3IxvR5ta2O57t2W8A:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: u1Z17-AQhPVEBMTzpCLsdj-hUzbuc8Ad
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA4NiBTYWx0ZWRfX/ISrmacQf+is
 rGtrsdk5vf5Gcg0LzpQ4NR2aiGv1I46ONSF5qYs+yOBcAG24rrklIIrpcHoHbQdyLWnIXsBh/cU
 fccUa2q6IHT+1hffdPZOiZy1FEpkTBRXT+TDeziQ8nEsss1jefVALs4bmKH0fj/TEcr/mMzXjPI
 eUdLFz8me7rF3ObhRJKrUXg8wfgcIKEGKDWxlYTAM5kGzWJSS6vWT4ey+q3taF5sj14GmiIeB+Q
 F3cTy2lLrcyleh7X8HHmoCi3M9Ifin+vCrCpN8lpMH1/WVbwwe4ccICxGCF9MlEy731J6S2DK6I
 gTCO1X3jPxOK+10Rb+CfZH6LrpivKdfLdkovsF+sVURiBt9V645ewI3kIdgLhlOZ2mlEFqmF0nS
 j6osk83jvXCnJJvOwh4dH/HV7uJzpCg/889VdTBGGjLH5OQ4tKRdGAONqJ5huEF8BjzPlWmCkPw
 Jj9Ej/ZyvyoYbv9/5Xg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA4NiBTYWx0ZWRfX7F+bQ1ZiM2dA
 tk7nUvaHlBncmCFIkZRg+PAf8cA9Zm1Xc/kz/jYsV1vpgtffIkPMQdQX9SquhR5xZ6+RdvaRUOt
 e9NQLZJybVE1IEVI8nQ8kgtLuHaszV4=
X-Proofpoint-GUID: u1Z17-AQhPVEBMTzpCLsdj-hUzbuc8Ad
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_134415_571600_2B5331CF 
X-CRM114-Status: GOOD (  26.71  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 12 Nov 2026 20:17:35 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> On Tue, Nov 10, 2026 at 02:46:35PM -0800, Jonathan Cameron wrote:
> > On Mon,  9 Nov 2026 09:12:09 +0000
> > Cristian Marussi <cristian.marussi@arm.com> wrote:
> >   
> > > Add a per-instance generation counter to track configuration changes which
> > > uses the common telemetry events framework.  
> > Why?  What's the usecase for this?
> > Needs some more information or I'd leave it for now.
> >   
> 
> SCMI Telemetry is specified and designed FW/Kernel side to allow for
> multiple readers and multiple writers issuing configuration changes:
> give that there is NO HW/FW/SPEC limitation in allowing such concurrency
> (unlike e.g. for a serial or an RTC) the telemetry driver does NOT
> enfroce any kind of exclusive access...last one wins when multiple
> acctors tries to configure overlapping stuff...none of kernel problem
> userspace should co-ordinate...and I suspect most of the time having
> multiple apps trying to concurrently issue conflicting Telemetry request
> would be a matter of wrong platform configuration/setup (similarly to
> what would happen by running together all the lovely varied network
> configiratio solution on a Linux box...)
> 
> As said the Kernel SHOULD NOT care, going back to the networking example
> Kernel indeed does NOT active policy netlink access..you are free to shot
> into your foot...
> 
> Anyway, co-ordinating access to the Telemetry resources in userspace can
> be a pain, so the the generation counter is an optional mechanism to be
> alerted when some of the Telemetry has been changed, so that userspace
> can spot that something odd is happening (if it was unexpected) and
> avoid to sample and analyze bogus data...
> 
> The generic event support upon which this is based, it is meant to
> support future events like relaying notifications to userspace...but
> given that notifs were NOT implemented for real, it is not present (NOR
> the related ABI...)
> 
Ok. That explanation makes sense.  Given it effects how userspace will
be written against this stack (maybe assuming folk don't just bind a single
daemon process to it) it does have to be there fairly early. Maybe
a follow up to the initial set like the stuff for already events.

Anyhow, add this info to the patch description!

Jonathan

> Thanks,
> Cristian


