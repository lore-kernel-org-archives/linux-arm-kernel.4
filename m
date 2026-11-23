Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FE9606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CTYuyxVU;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RClXlg3b;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L6GUlOoe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/NnFP+NSq0yyiHjtLtbCC56s3jL1Oe1DEEGxccAA6Kk=; b=CTYuyxVUIvNvBX
	SvyYsZwrmw8AIHqqWbB0AWeGTeiXEm234JrsWXmDXnR6LtCSIIj9wtufxpSRzJyAUN5wkxK/5K474
	p46fUoVsQvzMyisirKAWpehm3CE2AxOB+hGvuxjwh251fgkRl9Wuelu0i/7LjtB8ZfPFJWrtNcX/f
	Zz1i7bKGGEej6AhYfsM/8m5i7/PsmtTDON+TyhAwekvYukJtZuO7tBHmXzoS1JlDF7UINSlTIZdkF
	bbTGs8FPnNoezF24O3FUIW4qtADCGgFBkFnPaLFpw5o5PT21ukr5XI3EXD6mE0bx/dzn8pGywaTO4
	z8wReuqburGMtKtdascg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWo5-00000004BDx-0Vet;
	Mon, 23 Nov 2026 16:22:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWnI-00000004B1j-3FdY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 16:21:36 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH3U22340403
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 16:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/NnFP+NSq0yyiHjtLtbCC56s3jL1Oe1DEEGxccAA6Kk=; b=RClXlg3bWSFVwFHL
	QIIvMS4osiWGN6plNZ3HSiPYDwk15ExQT2v5rJk2V0p/KYwCTbk+5E/ggifEOVMx
	0VCoGsGrILpuAIPnr6oaLHg2vAOcMH5jtYG04gNG5SMrFgRqAIvwKsIaWxfssHQ7
	06BTXyxsS1ECvl1qEoKkVu4K3OFk0diTyq2HBMVpvObIIc7NSrWyufmYPo3t5ex3
	2CvvJjAKatokjGr0b6B2EFfiVyVw/ArN1NPzw6FQzL5tTsrs/pY3Ke3MDuSypnxs
	3VG5iH0OtjCFw33UpDHw7fsnMMohUbqeG00xpa1hwVanubq3qlrPgoSHh4gRtRhp
	0gdbVg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx2hrn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 16:21:28 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso3174624a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 08:21:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795450888; cv=none;
        d=google.com; s=arc-20260327;
        b=cocPcNqQSKTQwszfCsTluaD23SP5U66UD7N65gbt4nUCOsr1VxQq/MDy7aaFSyXegW
         Szf9pXcyeqyXtq+cbyZztHe58Mcd5pRINylKEwScDdHWyorriIN8EDFUbhjBMcJg4QIK
         bjk4OwJwVUG+rkegywquKGRq8MazoESL18ZGOgt0KFPWRkqzcOzSXPyjW2eo/fkTw4vL
         RTZDO3cgf9X2Z9SapcKfYSU2yP7roKA1v2LkZMFkvXsC+d791oPsYKlIO0NKT93Cvxr9
         +9eMFuLacvI+T9ZzdpRl8kE5F+KoUGlV03/twRK04tZy4EsigIGILeyRruc9wxTMfV2X
         vMNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/NnFP+NSq0yyiHjtLtbCC56s3jL1Oe1DEEGxccAA6Kk=;
        fh=kA0Qj7fb//Mv1JYfnXEkxdn6EYRRKaUJUuptIFMnp/E=;
        b=dCky2pMwtWmvFSrpHPd7Q/UNDVMQy7F/FMp9zPAmrQvoPrLkQJSiMFvrWJI0RsN3rT
         W7Vvt/a8C9UyXvjxhPUn6wfZp5sTyl22xexYJxs+pXjM0NuMt18wGqrwWvKX6UE63BfJ
         VTXjhfJFNy6ExAAq0az25Nwi9YHkpCl6akRfP1u9se3k+jwsYR1hcI9btazYo901Jmn+
         radHvNjlZOQ4D2BfxMNngj5HjciBORuUrY0/CCEdPMbYylBBNTBv7a5UkACDBnaws8dm
         i6tZrcxSi8UrWVWe+jFCtZ3ByLsPHxoc60FwimhNZuitYSSIpIDHHl/4KYNaQKQsO2w/
         Uahw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795450888; x=1796055688; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/NnFP+NSq0yyiHjtLtbCC56s3jL1Oe1DEEGxccAA6Kk=;
        b=L6GUlOoe3uuIhGa8tDXQNjSy9H1xQo49NOfhZQswLbSsV4c53LXdFqMrDBWiDxZ8GK
         X30wl6OSWrGW27+idJmDorVv4Zo1/hoNlucny8Zv/85/DNNq4MoIwoKAf8gkW9Emd422
         5jR2frmNC9zV9aLXvs1LRHbZTYGeTluuLg1MnLpnP1EH7deLU2NKi4rE01aMggYenbSj
         edyFBYs77aGBCvI13JtQdKyAcfrE4+UbUUfY2LyM1e8mGjR3xZtYXLAk4tx9Sm2G+bS0
         qA1oGPn2AeffPYsBSqCH2SP31VNmj2PvH/1HWYf4WwQQRx03yOKtFepsVcfubvJagaea
         9GfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450888; x=1796055688;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/NnFP+NSq0yyiHjtLtbCC56s3jL1Oe1DEEGxccAA6Kk=;
        b=oTIESxlwGHZAFdNYZ4/e2EaLmjiMPQ2YUrHofWnve4+tGMgbmuHWq8IQ+zpmdimxYw
         wOR4phIJs/Bi9fmhiXzn1wkOXquQ7fYOXYRIA2WGata00NwNRUHVTY7C4kKZZPHXf5QU
         4IbXy44dDMbyvUaKC58+wjWUetMbHIzW/3huvaeoRJzZSozx1HwAIzP9O9qy+YV7oTTx
         QbuSWHs7cZldf6MLuXdzC4nVjycQpCiwvJB+541ApEBXWhgzFJ+DjEEDmz7pyQCZrL68
         y7pdQl1DDHprcgcpWYuEjKR1LLG9JQ1/zghJ4/CSacc6Fjyrd2lc3EJJTG9DdVVe/pWm
         XFOA==
X-Forwarded-Encrypted: i=1; AL+hErFOGHbhkGiu30JMOvF+vRKKINNjBNi644HFl+HUReJc22e8c2oKWzSCXRlkuhS7IwxU63MzkJTKd6PSALsAsYgJ@lists.infradead.org
X-Gm-Message-State: APuU4Z/ZhhtvveAaun2b6OsEASmMYzZFb/vNwXe354FpCFZeO+0mdHoE
	6j0KWaZbKPNgda59n4HkQNhpFX8MQm5cKMIB+xi+6V8pHADrU+AwIiFQDLZb2/n4ijc6WCYDH6Z
	e3TMJK1ePhzFqNInNK1xX7yvL3n64sPEy29goT8wuF6vmSIvU3xnkRuMGXqwX8E/TwTJt5S7AEC
	5uAzgp/PtzYmUpIKWL2bKpzpZQ2CitKlyQkQ/c+8Q3/vqpOK4szsbN
X-Gm-Gg: AZFdTZdDkzPTTxP8e8nTwaD+z68QihGo4XgqaPLTUD1RJ4RVYjtBlrt+Lv5GPeVwo9f
	qkv4HBYDOkSYZS9UmwNbvfCnHuj0S++6aq5ZNDpihx6y6G3MZ31o+JzvwhibPYF3azEpSqN0vGf
	AbZNtwlvNkvFHaPr9tLQxf+Xewb7Qmd1qPtpVooo2zuJzyLnJsyZpN1Ym4+hEOa8/JMANw8v1Zv
	NOBuaQaTuqhRwsW
X-Received: by 2002:a05:6a20:7c20:b0:3de:557e:5ea6 with SMTP id adf61e73a8af0-40283cbd05cmr5442949637.27.1795450887602;
        Mon, 23 Nov 2026 08:21:27 -0800 (PST)
X-Received: by 2002:a05:6a20:7c20:b0:3de:557e:5ea6 with SMTP id
 adf61e73a8af0-40283cbd05cmr5442928637.27.1795450887142; Mon, 23 Nov 2026
 08:21:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1794615323.git.gahing@gahingwoo.com>
In-Reply-To: <cover.1794615323.git.gahing@gahingwoo.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:21:13 +0100
X-Gm-Features: Aa3M54rrQb2REYtBcbw06BpA4JyTdY7S7pcOgeKDB2ZGguRFDoBBypEfHT-AJbA
Message-ID: <CAPx+jO_F5T8zW3D9CNjH0W5pLLM9srGovUmqvVeWL2Z8dDDo+Q@mail.gmail.com>
Subject: Re: [PATCH v17 0/3] pmdomain: rockchip: RK3576 NPU domain supply and
 settle delay
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: ulfh@kernel.org, heiko@sntech.de, finley.xiao@rock-chips.com,
        shawn.lin@rock-chips.com, sebastian.reichel@collabora.com,
        vlwwwwww@gmail.com, leonard@lausen.nl, abel.vesa@oss.qualcomm.com,
        tomeu@tomeuvizoso.net, linux-pm@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b046808 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=9GNsruGHAAAA:8
 a=NEAV23lmAAAA:8 a=HctJ1lBftkvV2UQOCVsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=gf-oSkQAjqHFJRp-GQfY:22
X-Proofpoint-ORIG-GUID: H8QOx5yTMtOJyMxVMOqhTljeEDx3UNMk
X-Proofpoint-GUID: H8QOx5yTMtOJyMxVMOqhTljeEDx3UNMk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NSBTYWx0ZWRfXxj3gddZTltmN
 Er8ggWHvkEYpLVOYtG+QHzXQlKDELela68VI4x8xvqxwji9OCp+aNpg7q/ZF+T0OYicv6/zQgTe
 vrT9Eqj289Pu5hV0b7F82zii4TUv3o8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NSBTYWx0ZWRfX6k3YC4evo1YV
 TQVH5AKmW7OjfJYsgv1DjcwtQYBHHQXT4plgaGn9NQsWFtpTwYPQZr4Qa9fobkAtkPapBFI9xvf
 /WUTuk+q6DXP6lMpil1f3hAhaUDbj8/AUhUtrFEP7L7CZpGHBExWjL47iKtc87NwA587zGYxmQh
 jj4uvilZDypfyC/9BIQeQEAqkJAkrD1C33sM90fpZqEEE5KzPdkMuEMWdINQxhvXbcMwOipcHgH
 z7ZhYTdziq01nkHi1ZyJ6SwhT6fP7Z1+Jr5d5bl7xwEV01LidWlvf7ofMREANzjAEOzlQ2piq3+
 9MzDn+ZMNgNAxgzqqqzO3NyakhQXdlcDKzCit0xyMhnB6wx+Y4BfQU02CuOKTYddP60W+JqR+ZS
 8t37xoIK6mdjJ7kWCHsfnW9I/3DmJD0p0pmaX1ri6VRI12ZxmNJnVi2G22FgNYnlDzMzX31UFcB
 c53QLdWUEkS0hxyM1RA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_082128_828373_FFC53D00 
X-CRM114-Status: GOOD (  24.79  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 14, 2026 at 4:05=E2=80=AFAM Jiaxing Hu <gahing@gahingwoo.com> w=
rote:
>
> This series fixes how the Rockchip power-domain driver initializes
> domains that need a regulator, adds proper regulator handling for the
> RK3576 NPU power domain, and adds a settle wait after power-on for some
> RK3576 power domains.
>
> These are the pmdomain patches of the RK3576 NPU series, split out and
> rebased on Ulf's next, as Ulf asked after dropping v15 7, 9 and 10:
> https://lore.kernel.org/all/CAPx+jO-KKvgRS0br-3QGh6Jt4efWJ+A6YoRZKFV_bcfB=
+8sm6w@mail.gmail.com/

Patch 1 applied for fixes and patch2 and patch3 for next, thanks!

Kind regards
Uffe


>
> The accel/rocket and DT patches follow as their own v17:
> https://lore.kernel.org/all/cover.1794615324.git.gahing@gahingwoo.com/
>
> Based on: Ulf's next (844a13010b0b)
>
> Changes in v17:
>
> - Reorganized the series as Ulf asked, and split the fix for regulator
>   domain initialization from the RK3576 NPU regulator handling.
> - Following Finley Xiao's (Rockchip) review of v16, the RK3576 delay is
>   now 15 us on NPUTOP and VOP only.
> - Fixed the subdomains of a regulator domain being left in the wrong
>   state at probe, reported by Vladimir Bely (1/3).
> - The RK3576 NPU power domain uses DOMAIN_RK3576_R, the same macro
>   Leonard Lausen's GPU patch added (2/3).
>
> Testing:
>
> Tested on a Radxa ROCK 4D, with these patches and the rest of v17
> backported to Armbian's 7.3 kernel:
>
> - With the NPU disabled in the DT, NPUTOP, NPU0 and NPU1 are switched
>   off and idled at probe on every boot (16 boots). Without 1/3, all 14
>   boots left them on, and one of them hung.
> - With the NPU enabled, 30 NPU power-ups after a warm reboot and 30
>   after a cold power-on, with identical output and no SError.
>
> Logs: https://github.com/gahingwoo/linux-rk3576-npu/tree/main/board-logs
>
> Tag changes:
>
> - 3/3 changes the delay values of the v16 patch and is organized
>   differently, so I've dropped Abel's and Heiko's Reviewed-by. Abel,
>   Heiko, could you take another look?
>
> Jiaxing Hu (3):
>   pmdomain: rockchip: switch off the subdomains of a regulator domain at
>     probe
>   pmdomain: rockchip: manage the RK3576 NPU domain supply
>   pmdomain: rockchip: settle RK3576 NPUTOP and VOP after power-on
>
>  drivers/pmdomain/rockchip/pm-domains.c | 115 ++++++++++++++++++++++++---=
------
>  1 file changed, 85 insertions(+), 30 deletions(-)
>
>
> base-commit: 844a13010b0b93f8561ef2c088f843647d5e552d
> --
> 2.43.0
>

