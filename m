Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C284D606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 10:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cHelZXzz;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a8T9NsW8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RZfOk9ay
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DGFPoUFp3t53fChFBXjug+JBh7L+UZESY63HviqEWfU=; b=cHelZXzzd37QaA
	u0jmHFI9CXRjDpcXHqF0s2NvxftKtUNu3myo+WRLViuRDBlqqOmXl3HP2hfzfjiyEiHElELAER1WG
	rOk5xlRfbN65brThqyPv+d7ERXN39fskdsAxKFFs3cBQor4guUaII4MDLCuzrsPxFk495P3knSULg
	eWG/u1jqGXINxQKTFf5s07NMUBed/dQxG9dRrT5Wrg8ZntpV3NUtxth1r46GoUoSLPlW77kl3+pgN
	NN5MHHwBV9pfCDwabQ5Co9qXmcKGpGSxXdxqOka+rd5RZDanihyr2/A4m2+q14nmDxzUOLiHVPu+J
	pgbbf5nNyzITowgqBNAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAzo-0000000FlCu-0VAI;
	Sat, 14 Nov 2026 10:28:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAzl-0000000FlCF-2QUD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 10:28:31 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wKKL3379492
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 10:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DGFPoUFp3t53fChFBXjug+JBh7L+UZESY63HviqEWfU=; b=a8T9NsW8Qtkzm2OA
	wTXhAP4j3z4dEq5b1dzSux/5NfpP+TGTmcynSUWUjORJfbmA81ixFnKR33dJrCQq
	GP2kYsFuD9U2rAzmKLdGHPffE7bdPQZhJu0c8egNQzVvcOPsCAeZdMF8tJ2kmlNq
	Xy43dqmNrH74x+n4gbouuLiYpb8UIAokQXXb0FYNaCJs8jFwx96+OhpiP0KbcXal
	jtJiyAnCeecDKkv8puFaE76DN+n9V2PzeNEf+BzXGUD780m9Yr2cOho4BJzEtQIJ
	Jm8PKACog5/Kg384ClwTlpG5qjdWDZNyzauDWd6Ieig+aY4dvQbhielPtmhERZcH
	z95IFw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx0hee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 10:28:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ea381ce04fso25011685ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 02:28:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794652107; cv=none;
        d=google.com; s=arc-20260327;
        b=qvXTe854fYeFryPMQk/X1bmzu7XdrdLFqNSsZgOLofoDCyqJWH9LHS6S4IX6BMwG6g
         zwUHn6ZnNy+fT3iD/m2IgIktReQqIiKnrm8Jk1ijMXX+p+evx+Fi++FiMMJ9ue4Nt7BF
         xo8ph23IerKwdV5dhplm/qbaqXkB9KJeFb2Zzq5ZLOCLo62aHY4DYGF3i3oLYPYgZZ02
         SJftPtsDsNRzdtjG3nVNSvm6UQSv0tRWYZiDF/JytW0J/KGB7P36taz6VsrJbxvwR0Lh
         T+AbzZiJroTh7ZwbFRl2LKshxfufHEWwAVRH2p64PUcV8Y7tPnVSXeqvOki9HhoMS9Wl
         9d/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DGFPoUFp3t53fChFBXjug+JBh7L+UZESY63HviqEWfU=;
        fh=g/j2hqRejE8kgroRlnhFSVW15kxa4v0A2dUjUb/WjDk=;
        b=LtxwoUN5lr95KiRiFf4qxXl+CgEpm8E/3cdQeVNDDFjGEapa+hRJKqF08/dpeTBY73
         wRWQEeFHsrxLBz60gUPB49e1Lk5S4spt6E3PVk2LD+RZLQSK4pBNu/hpwAw/Vej7mmiY
         HwgxmU+r1PFInSAEbQA3m9jSHrG3mAhiC/0d0lUPM/OISaSHSSuOmCKCcKdB0Zo+tlwl
         vrLrwE/ryhnAMDsOZNE6uFklY6XFj8Jy02Wlk1dzw4HKbSUH9OWQsY1/aDMWvSox3CBF
         N2YNXSKmCVVv6vDyOFe2WMUvXyNuh/5NPYhAGKk849VTh7YWnIoEw+cuEduexxX2JEnW
         4I6w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794652107; x=1795256907; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DGFPoUFp3t53fChFBXjug+JBh7L+UZESY63HviqEWfU=;
        b=RZfOk9ayJpm1faUh19JUoyMUCiL6h6jjMSFLsClGF/oQ0bZx8SXMFYcXjqxGlE5gmu
         jDyfxUvC74fLZnH/byQRtSpTRqnE3txBpMprBagaOaLHsSWOD6kAZB7A2h6lfXdyWqok
         fIsotpd9VVDVElLbzL52kSCjfNoXxRplArq4+Ox1V4oGCfr/ARcNapPOYn0tcQhjicbQ
         kXxtPYVeas4p6fS/QPcnkgqLJShmUO0FT5gj8guKugr4vz/SU1/Y2l+jpf4jLlsjZMVG
         0MX8ASWyMgkDwuwZSXzxUCf0ul67y7wEa2FkZOFEXfK2Sax9It6HXKSTnzESITPUM32V
         xKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794652107; x=1795256907;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGFPoUFp3t53fChFBXjug+JBh7L+UZESY63HviqEWfU=;
        b=IulHcQr5snrqLNOPgTYpfH94qIE4HdkFideo++tXFO2/TIvskcJt9mdgH7XiUbrv2W
         cadEE71PipiwVE0wgz0kuzTspa6xAGu3TTL7MfxznO2MdfWzBE5Sk0EbK8MW+sdgC5wX
         BEAPoM1KDhbam8jmw/O0Nl8oUX35clWUw0IRmKjBtkezhxTyrYWVpX1GnUzxwiLnmGad
         O9wdMM+0b2k/JMHleivLGOkd3SDTUZ6EMBsSY9ycl3M3DGSQSyTGDg7kcwyvlERO0U+g
         Zbu37vnyiE80E/GpqIe5DbHPQytpXKMxiMKlLOWCfjnrIEKbPkQKlqRwNb6rn3IqG+P7
         1niw==
X-Forwarded-Encrypted: i=1; AL+hErHeMDhIM1PBMSqabQ/0eDkMl/DoYBwdLv1u+HXOt4ofsUUZfvL0i6a7g7WKeaW48l5+Cx6K1gIYHQ/yLH35XqtD@lists.infradead.org
X-Gm-Message-State: APuU4Z95RLJ68JpLJdIGOX/te3RhSGK6Z8YRE7iXopunytR1NrmgKHe9
	S9T8D67WTKydb8Q824wG1m+/h+2gAC8HRtuwR6yPS2zNt1wbuEMLFDI0/9IgJENT/GTqpraeDVx
	Q9XcanX3hFn+0IF+33TagpgKWiIfC8mkpU9YLWlMYonNlLAQLIsulbdSYaPKwmdT6SLP6FKcsDS
	tRlfmXAgcH6UNZR/7bOfsSfWpYUGDzNmrPXhf7qljuBW37iwRvazGd
X-Gm-Gg: AYBFou06qInjDMeU8NOodxH7oweGF/q8RUAjlblSuWozBnfRjZxcdnEoVg6MYpYYN+Z
	W20xrVnp5VZnGTY5bQoqLgRPIbmAYLip4avim+46FtcaSJjeeBEaObbyj6xv54CaZSL99UNzgoc
	B7vMTjvV7sithYtzh/vHNRDArF+Wmy9DGtVzLrII6N7S/aDZoE1QmKFWEl4g==
X-Received: by 2002:a17:903:3bc7:b0:2e4:ade3:7290 with SMTP id d9443c01a7336-2edf2161b1bmr54625045ad.30.1794652107257;
        Sat, 14 Nov 2026 02:28:27 -0800 (PST)
X-Received: by 2002:a17:903:3bc7:b0:2e4:ade3:7290 with SMTP id
 d9443c01a7336-2edf2161b1bmr54624825ad.30.1794652106635; Sat, 14 Nov 2026
 02:28:26 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104-add-board-ok3572-c-pmdomain-v4-0-15cf8b5a6e59@qq.com>
In-Reply-To: <20261104-add-board-ok3572-c-pmdomain-v4-0-15cf8b5a6e59@qq.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 11:28:15 +0100
X-Gm-Features: AclHuK8CTcJQlL9BkywlS1ynPK24J1pLlK3GHhNiwRM1F-ARTEv9AUD_jeySnPU
Message-ID: <CAPx+jO_88-xLLiPeE1QPjceCBpBuX0ZXsB=-vVVcGmx_6vnWCA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] pmdomain: rockchip: Add RK3572 power domains
To: 1579567540@qq.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Elaine Zhang <zhangqing@rock-chips.com>, Ulf Hansson <ulfh@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Finley Xiao <finley.xiao@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0MSBTYWx0ZWRfXzNun3rhOAWsC
 h1LJlwfasrxFkbD3tWTfALZvfG/aQphyDhrWK5Bpyl9vmzW4gX34LqnJMrMJ2gvsKCZb62mMRgV
 7jfCo+SWKKC8kSsO3oitttBHpv5BF71eTdONCcogDC5jJqloDcqaVvSkLVKiceIg+CjLqnoUzDG
 TqIQm54wz6B2a1b0+HLxsLjq4F88a67/SIL+8tR/fWTTbIC1ZBokf7lnAhdXbe3dHfpOQbyjhLe
 BpZpfuaz+4ptZLYee/8Gg0jUUqMF43yr1fPChRffoLZ1BHlNk8rXNuvKJliScdFRAud21EqzuNg
 hTdFMI2TIc08QEw1hiI/wSZKT9kSiIt0z0RQj47zoFQAq4zbG/KNXMQNScfZ6px8xoPss9NBK/v
 ff/dTApdbpz5F+GJ25CPljPohU76D/8ubMfG8pzCzgGOJA0dz1voziUY0fUWC+W6+RtaZOo7j05
 GS8FmU2HKdsNjF7E/kA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0MSBTYWx0ZWRfX4wdyJloD93Mk
 PSsKgJ4zsJEnbHkbqw8SmTXcd6fA6oXcGNn9l2NsONFibbZCQYRoQtaJgASCOTCuUwwQmjBCJIT
 +Iey1dYSXt6qFkcNXAIr+qlbN+Ze7Lw=
X-Proofpoint-ORIG-GUID: E83Y5G1wppd0pT5f-6Jx8mj1kl0AZ_93
X-Proofpoint-GUID: E83Y5G1wppd0pT5f-6Jx8mj1kl0AZ_93
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6af837cc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=bC-a23v3AAAA:8 a=dZbOZ2KzAAAA:8 a=VwQbUJbxAAAA:8
 a=s8YR1HE3AAAA:8 a=JfrnYn6hAAAA:8 a=4uetKMasqe67zdwg2QcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=FO4_E8m0qiDe52t0p3_H:22 a=jGH_LyMDp9YhSvY-UuyI:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_022829_752392_020BA38B 
X-CRM114-Status: GOOD (  36.65  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 4, 2026 at 9:57=E2=80=AFAM Cunhao Lu via B4 Relay
<devnull+1579567540.qq.com@kernel.org> wrote:
>
> This is one of the subsystem submissions for RK3572 support.
>
> This series adds the RK3572 power-controller binding and power IDs,
> followed by support for all 14 power domains. It includes system GRF
> firmware shift-ready checks, NPU voltage-domain control and genpd startup
> protection for boot-enabled IMG, VOP, VOP_PRE and VO.
>
> The RK3572 SoC has eight CPU cores: two Cortex-A73 cores and six
> Cortex-A53 cores. It also integrates an Arm Mali-G310V2 MC1 GPU.
> The OK3572-C board provides two Gigabit Ethernet ports, three USB3 Type-A
> ports, a Type-C dual-role port, eMMC, microSD, and UART.
>
> This series depends on the separately submitted power-on rollback fix [1]=
.
> Firmware readiness failures reuse it, preserving the original error and
> saved QoS. If rollback fails, the domain may remain on while resources ar=
e
> released and genpd may power down its parent.
>
> [1] https://patch.msgid.link/20261101-fix-rockchip-pmdomain-power-on-roll=
back-v1-1-59a45783e33e@qq.com
>
> Testing was performed with Debian 13 minimal and Linux 7.3 on the
> OK3572-C with the FET3572-C module. Shared peripheral tests were run with
> the system booted from SD, while eMMC validation covered the complete
> boot chain.
>
> Passed functionality:
>
> - SD and eMMC complete the firmware, kernel, and root filesystem
>   boot chain.
> - UART console works at 1500000 baud.
> - SD read/write and data persistence checks pass.
> - All eight CPUs start; CPU frequency scaling and hotplug checks pass.
> - Both Ethernet ports obtain IPv4 addresses and pass bidirectional file
>   transfers.
> - All three Type-A ports pass USB2 and USB3 enumeration, data transfers,
>   and reconnect persistence checks.
> - Type-C host and device modes pass in both plug orientations. Physical
>   reconnects correctly select the expected device, host, and device roles
>   in sequence.
>
> Stability:
>
> - Repeated cold and software reboots complete on SD and eMMC without
>   data integrity failures or power-domain transition failures.
> - A combined CPU, memory, network, SD, and USB3 stress test completes
>   without a crash, lockup, CPU offline event, or thermal shutdown.
> - Ethernet error and drop counters do not increase during bidirectional
>   network tests.
>
> Power-domain validation:
>
> - All 14 domains register; 11 complete 1,140 runtime-PM cycles. NPU VD
>   sequencing and startup-protection release are checked.
> - Physical cold boot with an eMMC root filesystem succeeds. Read/write
>   checks pass on eMMC, SD and two USB storage devices; both Ethernet
>   ports pass ping tests bound to their respective interfaces.
> - Thirteen return-value injections after successful operations check
>   idle-exit and firmware-readiness rollback, NPU cleanup, original errors
>   and saved QoS. Retries succeed after removing injection.
> - 124 host model cases using the driver and genpd pass ASan and UBSan.
>
> Build and checks:
>
> - The kernel, modules, and board DTB build successfully.
> - Strict checkpatch reports no errors.
>
> Untested hardware and paths:
>
> - NPU
> - PCIe
> - GPU, video output, and audio
> - CPU rates above 1.2 GHz and voltage scaling
> - Other low-speed external interfaces
>
> Some files in this series are derived from the Forlinx OK3572-C BSP
> Alpha1. Thanks to Forlinx for their support.
> Thanks also to Rockchip's David Wu, Elaine Zhang, Finley Xiao, Frank
> Wang, William Wu, and Ye Zhang for providing the driver source files.
>
> AI assistance:
>
> - Codex / DeepSeek V4.1 Flash were used for:
>   - Reviewing and adjusting code style to follow community conventions
>   - Automating tests
>   - Collecting data
>
> Signed-off-by: Cunhao Lu <1579567540@qq.com>
> ---
> Changes in v4:
> - Drop generic pending-state tracking and power-off recovery; reuse the
>   separate power-on rollback fix for firmware readiness errors.
> - Support all 14 domains, including NPU voltage-domain control and
>   cleanup after failed transitions.
> - Retain boot-enabled IMG, VOP, VOP_PRE and VO domains until sync_state.
> - Use firmware shift-ready naming for the GRF status.
> - Build ungate write masks with unsigned arithmetic.
> - Link to v3:
>   https://patch.msgid.link/20261026-add-board-ok3572-c-pmdomain-v3-0-70d6=
14d3d921@qq.com
>
> Changes in v3:
> - Track incomplete shutdowns to preserve QoS and complete firmware update=
s.
> - Preserve pending memory resets across shutdown and cancel unfinished
>   power-on requests.
> - Attempt to restore the domain after power-off errors, while preserving
>   the original error returned to genpd.
> - Link to v2:
>   https://patch.msgid.link/20261023-add-board-ok3572-c-pmdomain-v2-0-79dd=
d42e92c1@qq.com
>
> Changes in v2:
> - Split the original RK3572 support series by subsystem.
> - Track low-level power-on and restoration separately. Retain unfinished
>   memory resets across retries, avoid repeating completed resets, and
>   preserve QoS snapshots when shutting down after a failed power-on.
> - Link to v1:
>   https://patch.msgid.link/20261022-add-board-ok3572-c-v1-0-0b0fd85a31ee@=
qq.com
>
> ---
> Raw dmesg: see v2 cover letter.
>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Heiko Stuebner <heiko@sntech.de>
> To: Elaine Zhang <zhangqing@rock-chips.com>
> To: Ulf Hansson <ulfh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
>
> ---
> Cunhao Lu (1):
>       pmdomain: rockchip: Add RK3572 power domains
>
> Finley Xiao (1):
>       dt-bindings: power: rockchip: Add RK3572 power domains
>
>  .../bindings/power/rockchip,power-controller.yaml  |  17 +++
>  drivers/pmdomain/rockchip/pm-domains.c             | 168 +++++++++++++++=
++++--
>  .../power/rockchip,rk3572-power-controller.h       |  30 ++++
>  3 files changed, 204 insertions(+), 11 deletions(-)
> ---
> base-commit: 99e3bb2c6f246f38179cc569e38a45d9555206ed
> change-id: 20261023-add-board-ok3572-c-pmdomain-2f02da11386e
>
> Best regards,
> --
> Cunhao Lu <1579567540@qq.com>
>
>

There are quite a lot of patches on the rockchip power domain driver
in the pipe. On my end, I can only try to apply pieces by piece, but
it would be nice if you could start reviewing each other's patches to
help coordinate this bit.

Anyway, this series needs to be rebased on top of the latest changes
that I have queued for next. I will have a look when that's done.

Kind regards
Uffe

