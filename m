Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A28606A325
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 15:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bX75azo4;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i9cOGYDw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f/umFKCU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mBoR5s6oMFRgFxiQj9Lay5NRlrAbxIjp94cmKVZAPUs=; b=bX75azo4rXIEfz
	D4t54Ah2JDb1UXzDOuGi3D9NhfOCvVgXEurbsrOHH0OqtyiKvsaTI6jhoM42ZB4g79vVBKppJ4RWJ
	/bpgR1h8zk5z4a/9WifC66Ao9nFzLF1DkN+Ia82vrtO8uywAYYUnVn8+bkGvx1+sDy0Ql8APimCEV
	UTrG8XKel0yB4zIF6XG72y5xQxtRuFahSwkXP6Vrrag+yugPRUmnM15AU5YNzwG7pDMwNNgaQBvs6
	UTf9wuoFgAXnhnjwZNbp8IBaSv9X1ldXxb6c58WhklG8SlcrDtTGTKzT3lNg6XY36JBQ92+Hv90Vv
	Vu+fStbMhlzOCuZIVX3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRb7-000000014lp-3Omr;
	Mon, 09 Nov 2026 15:47:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRax-000000014kq-3VGW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 15:47:49 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFDkh022892
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Nov 2026 15:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mBoR5s6oMFRgFxiQj9Lay5NRlrAbxIjp94cmKVZAPUs=; b=i9cOGYDwelk3Coqs
	Lnm8maHufdSmKU9agpzwAvGEnrGe1g5maoL0oTeVD2vMKitnjvDHsdPqVeSvVaeI
	8nr0owWuRV8qvu3XZ25Qbi3V4RogyWXbuzeeqyOrkViAgfS2pQJe96Hj74eVjOQX
	bq0SN1Pt8Z+6XxT+aLfgNFz5p+vlBgxOf19lybW5u333SlW1ZvHV3+qO3TrqqIbZ
	ocpDF5hn9FSnNyM7KsdzYX85ruuSxU7+zvrLBl3AGbGSpypeBdxqmoJvhts8qywP
	8glHvw+f0GasDtS1A9Ktp7VJF8hXE38GZ/yPi1Zg9j7yntBx/XJjX75vgZG6qtgV
	nJ9Cpw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydh0su-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 15:47:42 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ece7f075c4so298685e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 07:47:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794239262; cv=none;
        d=google.com; s=arc-20260327;
        b=CtLzd6bAcbPVOSMRZ9ePqGDETEkjbRliPI6pdwhAdrQtZLUqo/C3VYoT25sxriDN7M
         NAWAGiSXnL3j6sScLDeGFvgg/yPeZumPpWBxCYee5mUe1lnH5LoXv3W0e1u3HkTsSuMJ
         57PueM+093ixXcZaDj3GzbWASwfZepXDwFvCT6KH65EdA2kZUYJUSCoBU/SSuFMU4K2P
         /TkceXRUYkiCJ4ykpGb3/muDpE9IxKYNVK8kC0Fr3TNJU4nmIP6B8kvpNt+QCjoN4Jq1
         HYj7kI7+FD0Nh5GguitGvhqnPtFZeJEF0a/aac6q4sJT2ckKTKp+HQchKCPdgo6bP3iR
         SCzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mBoR5s6oMFRgFxiQj9Lay5NRlrAbxIjp94cmKVZAPUs=;
        fh=bKWBcDpFPIriIBzeB+13T4u+jrKoFci6s4bcaRnb2QI=;
        b=pJsyEFWRRLBmHqBqDtm/yHwSw3pAMuiIeaW0u4iVZOmjCYHVtoNgolN8KSVoZPM7it
         qTu9Z+x1+FWPUpXsgaZLiexjQ/vQ5eeFwbfX74taA64OMAnCo2Z9ys9dgwoMTN1Ycez2
         X35ltgc9pbTm1FMjW4Vb9x9dr+4QiqdeGRQQDBhcqKfgYgdF7gLsu/mMrFcMk8DTbt5Z
         fpVggC7eaMgiZwkVpw+ILbOPQvHw4NzP9G8cRw0sL/TebdCVbqbOWrGl7ahyRQcX1osP
         /U17fx3VrUuOQtZZ8Mc7kkMVusMtiIJG7pq98LmadpyN+znRyBN7wb4u2HHKLWtbZSYM
         nt3g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794239262; x=1794844062; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mBoR5s6oMFRgFxiQj9Lay5NRlrAbxIjp94cmKVZAPUs=;
        b=f/umFKCUfZYhfUqd9CAds1j961Fru54vgTKwMDFrAZqUEB0FREJetYnPpGIF8Euylm
         4RunbQRYqQDsB49DOb4sKn10wN3So4sEtwhU8c6gtnRR/ycmtg/z0lvlR8hkXKgCBETZ
         e8POM7yguMTuxq/4NinrOg9tO4wjpjRVmnOc0D1rvaqW7x4dmka7/MxBBTb0QEEc4nLy
         o9Y3Y0EoJGh4J/an3Z9cIDUDd96OucwWKyfIXeq6lGoX4CHFxm2AnEzK9NnqHDNUvxSv
         qU/lVcrKEchHXWE5EGNM8ddVv4abRKG+9rSAaCVTp8DG/IjYTTpN6gB6YzBmNTZ9xIUr
         gTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239262; x=1794844062;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mBoR5s6oMFRgFxiQj9Lay5NRlrAbxIjp94cmKVZAPUs=;
        b=UYfnN2JAXFoq2vB9Gtdj3mbR9pCIAY94717NbR1M9Vi4ZRG+kxm41wNLkBGYckKMvt
         7IkQbI6gbMThnjHqQFHtShYY+kk40KPEP73sza3aHN5yCNvBzl0ViYCmqIhuFQsKLWZn
         ujqnaDevY0jxKRk+OPfb2ejFjwV+u9NlZeOB5CIlYtjJRHbxzUjzRrL4erXt+Rj0qgbq
         q6/wqW2rdEFql39RBmq0XYCakC869iLpNerXdtDeE1tSWonIgN0K7MKM2MNWSs78+NuI
         g4gdAqYyw8QCszyTXDJc/1zrvOIyGfwmDfxho9evzDP5UkMpCcRkSWMWyGPrcRFyudVU
         Ljjw==
X-Forwarded-Encrypted: i=1; AL+hErFvfYDnyr2BQhdwoGgs7gEcOTwXRtBXsZ9x6TjsYtViRffwezO+R9saooau07w+jq8xQ1r90QOdY4Q1lhkZWhee@lists.infradead.org
X-Gm-Message-State: APuU4Z9MmJ0zoVAUmxpbVmjEw1h4SIqpWNzZMo3k7k+tb24qXG24uQ8S
	JYFrKnXW6zqvAsqUjuwsrv+falvIF9TlEsECX0AOyKhAnmlDtIlw1VwCPk/8DKHqyFcegGkhHCd
	22Z7+ZYdo6Ij6Xte/k9OiTgwqWmOCsNK4Rgy80kZs4hDrr52k57kGWwCXq1R3pnY5dYA9tKpk6j
	fkpWJgkB+M5w2B74DVpfloLoq9N/jKM8o+ZYCnnS0qDTCkNacPv+Z+
X-Gm-Gg: AYBFou01mB6Zs60jWHTXbzfU64PwEa7hV8/SY30/gEG66FK+LGAEszj64YPMwxB1776
	d2wuCHcGB6QS+iU2LdTYbrS0m7F+LtJYBdda2ErvizHM7EtFs2jjVldoILNNAAAJCfSASWklATN
	XQ3OQP3ASzSMC0lP6v2LmAAf89ouwMOcoKf4nTkqNOnhI2hUSyLS6T71ZXig==
X-Received: by 2002:a05:6122:32d5:b0:5ea:b294:f0ab with SMTP id 71dfb90a1353d-5ece7143d92mr1480869e0c.2.1794239262087;
        Mon, 09 Nov 2026 07:47:42 -0800 (PST)
X-Received: by 2002:a05:6122:32d5:b0:5ea:b294:f0ab with SMTP id
 71dfb90a1353d-5ece7143d92mr1480860e0c.2.1794239261690; Mon, 09 Nov 2026
 07:47:41 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 16:47:29 +0100
X-Gm-Features: AclHuK-Kr7TGoM1o4LoUqHv6QGn1qOkyGnkGREVNczQg09-nH_zkvO-sNuQEANo
Message-ID: <CAPx+jO-WLCnVecquKbVaCcErbhuFt6OHFUmzbgNHjixx0r-wMw@mail.gmail.com>
Subject: Re: [PATCH v27 00/10] Implement PSCI reboot mode driver for PSCI resets
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2MiBTYWx0ZWRfX0QVy/H0DV6ZB
 +iL3FgY5qJqb+OVwwRhWkG+tX5hEqOvOSByyx3CkTP2415t+8yLwBB7AR5bANfys9EV6SKlRLE1
 ENF29nS/RTP37rqYO4soA/GK8G/GJKQ=
X-Proofpoint-GUID: iri7QZE-gR7dnROmqqCD4G7SbNc01Hoc
X-Proofpoint-ORIG-GUID: iri7QZE-gR7dnROmqqCD4G7SbNc01Hoc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2MiBTYWx0ZWRfX/yl+FIJDTn+S
 uLz44YqBFXhvHSR3/KmHPqkpShhHun0KWx/pwkbVV93x2dzAXaDG+1fbp6ARgmo41/5P4Ev834W
 wjDb3hYmiLhd3RvQecr+zMWRojK+/GXYjLmtmqhAFVcV2AhfoIfuDh8d2ab+PuXZiApZuOU/7Tp
 0AWmbv02LPvOGfdmszMceOMaugp0HkFGpw8Tcd42nVKsVVOiR9oAQOmdb2WWtjNXfm0t9kjYvBj
 8PAxSFqhiTqeR4upZ8x7j3v24J9y6qAQ8RWtGf/0MQhpd7StF7s1Ir5R85pxDIKah9vIn3wDLlV
 k4lVYi26hQqJ0lw0RQKNc5s6dwQ/wlKw8Yyjw45y017rnPLMCYYvwAB+w5psQwnDNxFxvQMP0Rd
 z0VqS3OO6FpNS478xt+1JaEt07X+/GIgo9jSkbkFvs1rZ0J1hS7qozPysRw4B7k0KaJ9PRQP97R
 VpBG1yMXc9JrAAFDbmw==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af1eb1e cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=7LcMNQwP9uozhxO2aV0A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_074744_615819_B3E900D9 
X-CRM114-Status: GOOD (  25.93  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 10:01=E2=80=AFAM Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
> Userspace should be able to initiate device reboots using the various
> PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
> patch series introduces psci-reboot-mode driver that will induce
> command-based resets to psci driver for executing the device reset.
>
> The PSCI system reset calls takes two arguments: reset_type and cookie.
> It defines predefined reset types, such as warm and cold reset, and
> vendor-specific reset types which are SoC vendor specific. To support
> these requirements, the reboot-mode framework is enhanced in two key
> ways:
> 1. Support upto three 32 bit magic values as arguments. This enables to
> support for a 32 bit reset_type and a 64 bit cookie).
> 2. Predefined modes: Add support for predefined reboot modes in the
> framework.
>
> With these enhancements, the patch series enables:
>  - Arch Warm reset and system reset cold as predefined reboot modes.
>  - Vendor-specific resets, configurable via the SoC-specific device tree.
>
> Together, these changes allow userspace to trigger all above PSCI resets
> from userspace.
>
> Note on introducing psci aux devices:
> Based on feedback from Bart, Lee and Ufee, PSCI child functionality now
> uses aux devices instead of an MFD driver, with psci-cpuidle-domain and
> psci-reboot-mode probed through a common PSCI aux device enumerator.
> Reference discussions on this:
> https://lore.kernel.org/all/CAPx+jO9Hi2R_UnCEhsXLwf74c3RTb+RodaJ6SOVXbQX_=
eHt++A@mail.gmail.com/
>
> ---
> The patch is tested on rb3Gen2, lemans-ride, lemans-evk, monaco-ride,
> qcs615-ride.
>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>
> Changes in v27:
> - Removed unnecessary headers from psci-reboot-mode - By Bart
> - Rebased onto current linux-next.
> - Link to v26: https://patch.msgid.link/20260928-arm-psci-system_reset2-v=
endor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com

Overall this looks reasonable to me, but I will take a closer look in
the next few days.

When it comes to the merging strategy, it seems like the best way
would be to funnel this via my pmdomain tree. But I need an ack from
the relevant maintainers to make sure there are no issues with that.

[...]

Kind regards
Uffe

