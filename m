Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D511606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 12:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LpnogwVn;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NcHOfw8r;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kMcDwA1O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GnmeKXoTKhOyCDZP+GpD1/6T8nYJ3ksjxHtTGDe1aX8=; b=LpnogwVnLzj7he
	U4FoO4pQf/2gD3hNR9nEpsiJQXOFI8eTVyuBNcCt524xq+WZ8mZm291GHQ48tyHL9Uk2fbiBu1nfy
	VhpHUdJsxw2SVQ/GDe7nStcVAq19Sws55utPFYMuqmsu18kNPulqCG6rjnVLfrwmiDIRIfKdRWhCU
	tZKj74PAFiN2mLVJf5vs+JuZbQh16R44YiwWe47YVHfVXTXtJgGiY7jrqG+hb70XvbjYpH02uTcJ5
	7rekhEhtgSE3DC+j0daW9l9hiQsO0U/YJUZVm7vc3amU9U2SIfmyR0H9NYT7KRqIgtnwcdTIL1ZCC
	uJxICtQezfCNuEJErvTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYp7-0000000DCbc-3iHt;
	Thu, 26 Nov 2026 12:43:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYp2-0000000DCab-1L7T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 12:43:33 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVUsF2758291
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 12:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GnmeKXoTKhOyCDZP+GpD1/6T8nYJ3ksjxHtTGDe1aX8=; b=NcHOfw8ru6Y4BXRC
	0ngT9SOy7f+e+5Ym7yuEXiV3KRGQrhm4JE82z9Iou0J0bbzl9X4lvf+zywRgQdpD
	TBfAJTRsYLTDjJnAgHciPvBW/7u+lHPgftMCwp0Pq6y85EelLE9spIXbYru4/l5+
	Ghjf0ZINuePAwwp4+85m0Gp9KW7jOtZY6MZXyRAOiiDeleDp9b6UxTFK/ELAT38n
	JcblSv4xOPp+vs2eAVRcQLspbT3NRwlSpcAIlvuVuHAc4yJfsG7OrX5BfXUsk5Cn
	7yLJf57Fv0/W8T5D2QvfmxOepgDEShR7miGXlIitqgrG0xP6mqn3VM4NRiCXpQR1
	G6YuMg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahvep2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 12:43:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3f3e256e8so6689952a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 04:43:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795697011; cv=none;
        d=google.com; s=arc-20260327;
        b=i4sYPscXw2B5zlIerc3FiPZuIf7iTF2sBlFs3htso5U7TMWl8yY93ApLWmZT4MfBxP
         kO0ShV46Lu9cou3t8Ix/w0ctVrpkZsqye6lKHuuLDn5P2hy3SNfpW1YTNastS/CeGu/i
         OvmnIyJIOmwK9wYmDc0QLgh5olXLmcKI6LVVs6+QiNneRBFLO+DF/jNcpZ1sGZ9dLe6d
         zxDvh5pAj/HIBgh8RG7kYYNKsDlv+uqH8pr1WcgRDluKd/UvhuQ53EmNPI9+qy92XRGI
         e0rDpIaeW9EsMaU0e3H8vWq9rLk/TFWezJzCV/FdIXG2Yq1RhX789j60p3mLQYRB8K3k
         1vXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GnmeKXoTKhOyCDZP+GpD1/6T8nYJ3ksjxHtTGDe1aX8=;
        fh=AfXzGXBJvOi/mZ6mR7TikK3EZBvWzB3XmBnEjhetIPs=;
        b=WoY8nsTDYJdb7QE26i7KPvfbXpE1HVVr9r+DSrEOhezaXB26Q9nhWvpWk8PhlsNzxZ
         d6EFIBWj3XXv5okec4WZZ6IzO9urxRES/+JxjrGBno/DqrkHlvwEdUb40bWL3DqE/O8h
         del1JevrvP0dFHdxRgZvh16AOfQV/SwXK8NcuY86KpgZxScvK2CtTLy947WnoGqrHgn+
         u+TS/rPbpqhIl2okkLOLg6l8X1ap8WgLIR1p1ghWsSOpURTbeLKBlP+GKMdSb21auSl2
         6vwKF1Uqait1QmqxzXVf8Mmq7YxG/t5P9ePTo50sKjwJPw1ElFKSaPxchiiaZcXAFRcp
         Td7w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795697011; x=1796301811; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GnmeKXoTKhOyCDZP+GpD1/6T8nYJ3ksjxHtTGDe1aX8=;
        b=kMcDwA1OMNivQ00maQO1Ib2Bvctz7uFGZmClr/Qt6i5LG9mYKfkqmL1yr/f8BGL6E5
         ksXPiu7kmUiLRw/9TYsxDIHYk1bCaA9YFPniUJH3XEYZIasrTp3Bp3przbDfHdzQImH7
         E217n8wISClLIxKYk6bbyxctS9j3QCZ3WpddeejztcjZykIR+DBdwbHpJFU5jcQcsfx4
         pxgKlLQkCH+FBDiQtZaqfMfSF/0kwF3YrAfMHtDInD/TcMSull6Cs1h+frfJHVMTzT/e
         7q3BwVxJprtrRZwBty0rIm65f+sATPSCOKZZY8Sq/mYL3jR6bV3ebvQtNxVnFqiFYOml
         rgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697011; x=1796301811;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GnmeKXoTKhOyCDZP+GpD1/6T8nYJ3ksjxHtTGDe1aX8=;
        b=2axvr5oEToLxc6zVZjDMrnJqyknWH3mJuJ595THcTDvXl7nFqxjV7A6S50Ib5EfcZ3
         +zXp4nxBcT1wj19Dm0GRLMYL6zNd46YeNKyFKr4yvTko483rH5a1JuGz7g1eQDW6NUq6
         gp9sE30djfVrQROPsABWCVU7Kbr1/c0lXy2ACmMk4QhXm22oDoqd19EJRsgojTXfmgcK
         SmM5fzZ+e/PMSrBGyN5Y0ODlh9uHmQCzG4U+0ou3o56ro5LIp2j03B4PaLPiWn7hUu67
         e3GdMUSRHymHaDfrmlXtvWDfr+BhuZVYrfnfkg1c7haNFLsBNseg92GRLhO8q+MkJGrq
         MsCQ==
X-Forwarded-Encrypted: i=1; AL+hErE7kS6ljcPZxzcOoUiRuy/zb7xyQMCb6ojpJkJjj35vK0+56XS9mfcLVc0vXwCpW/hRBJetuWyMiueNylsRU287@lists.infradead.org
X-Gm-Message-State: APuU4Z89/K/7pkLp50C9AitaxbVNf6tdS5ZYlUvrBVs+/sBJv+pQkwqL
	SW1NWOnlNB/5S5zS50QpK7A/IlIBJh8rqa9lA/SGhM2Et7ES84F7GFpMOXN0nb4Has0jM1rYyMh
	TjbydYF+Cju3ycRAS/QP5WCI2NkwugHTeuzfjo73yHVzgEpY3WngKZ5HC0qxrIGF7jLKboezX8L
	OmbLBcH8kCq5oJH9fU5hQ44mdXsl6XG93IXK9k7AX0UPtHXiFahuLc
X-Gm-Gg: AZFdTZfJB0ADziRJpCGLWb1NERTNqevJG+vHGOK1uStFHyJVq6d5UTwtEGVGKYLvK5C
	PEmbmoRDQ3cg6TCgzf0P47EPggdKTUomgS2qZE4J/P30uU8ijP2tjGRlbCYcpHVkJD8xgq+mvoi
	0VhWXlrzTYRFu4D/VpilXstvlydJGY86oJeIsxBYOGOwcmbykdk1BnI1y7MA==
X-Received: by 2002:a17:90b:4ad0:b0:3ae:9944:3bf0 with SMTP id 98e67ed59e1d1-3b41c938c77mr19665434a91.34.1795697010870;
        Thu, 26 Nov 2026 04:43:30 -0800 (PST)
X-Received: by 2002:a17:90b:4ad0:b0:3ae:9944:3bf0 with SMTP id
 98e67ed59e1d1-3b41c938c77mr19665406a91.34.1795697010325; Thu, 26 Nov 2026
 04:43:30 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261122-rockchip-pm-defer-v1-1-5b41635e3410@bootlin.com>
In-Reply-To: <20261122-rockchip-pm-defer-v1-1-5b41635e3410@bootlin.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 13:43:19 +0100
X-Gm-Features: Aa3M54oXEG0UXV0h1Ay8EFT6l0_fiX2X2Hu5kQov4OoBP9nRPaNYuRXl0Vc7i6g
Message-ID: <CAPx+jO8+WAK+W8BVOSJVHoLEvQUUr0-d7gEEK+yNwhJH5skYUw@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: rockchip: fix warning when deferring probe
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: oTKSSF8EFowR2u8lYlZEaP6ujdBLagxl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0OSBTYWx0ZWRfX7CZq/q5wE2Ne
 I5XljDox1D1aITX8zak0rBKrmNykbWQqO6EHCAN75DaLssoCfS0mrF2v331189meOMPQPlXMbHB
 JhK3CrbvB8pNjf76iM7ZciTVaojG7FA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0OSBTYWx0ZWRfX3zEG6x8ktMww
 UE0SgXOq4Y809my+q8x13sR1IoFfPBGOfiG1BuVd/24Weegcr8rw0ewaLiULzy2o2ijFLdQVBQz
 03VeoahM54W8VoculuV8IBNwt/x5TJJb6R0JvxGfbKv7bb66XXghbj/ndBLB++1hv6mfXNgJsqa
 awTex4B8djMjdZFZjLko++qU9AaAUEdoNVhMVwHqs2tv2uf3FYF1L6P5M87Qn0dPTbPQYE1xnOk
 7sLwtCkweV8/TQPnx+GeYERMjk7Gc9a1/ZGIvOPe93t8ki+EJ7JIb41/DVFF1cUtNeircLAHm1o
 kKEoDsbXfA7gCgq2idhhGsUK9jdZ2mN0suBgZ49wtiUHh9VPwvCTlwxWg929E31YOl1MM1iBub0
 lUVpxjKXTaT7JksUBDyIqg/FRgi+boDwdpzc2tWrU4yk5k5tgFpFQTQTJNRFNB4EQI2fQx3rSeZ
 f8m/t0cJJJ8Wug9jZpQ==
X-Proofpoint-ORIG-GUID: oTKSSF8EFowR2u8lYlZEaP6ujdBLagxl
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b082973 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=P-IC7800AAAA:8 a=cFyDgtjIdI2ehFJVjNoA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_044332_361158_6C31D8A1 
X-CRM114-Status: GOOD (  25.95  )
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

On Sun, Nov 22, 2026 at 2:38=E2=80=AFPM Alexis Lothor=C3=A9
<alexis.lothore@bootlin.com> wrote:
>
> When the PMU probe fails because a clock can't be acquired, the
> pm-domains driver raises a warning in kernel logs:
>
>   [...] power-domain: failed to get clk at index 0: -517
>   ------------[ cut here ]------------
>   WARNING: drivers/clk/clk.c:4831 at __clk_put+0xf8/0x130, CPU#0: swapper=
/0/1
>   Modules linked in:
>   CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.3.5-00004-g552d0d1e0=
9f2 #103 PREEMPT
>   Hardware name: FriendlyElec NanoPi Zero2 (DT)
>   pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
>   pc : __clk_put+0xf8/0x130
>   lr : clk_put+0x10/0x20
>   sp : ffff80008192b750
>   x29: ffff80008192b750 x28: ffff80008147aee0 x27: ffff8000813400bc
>   x26: 0000000000000000 x25: ffff800080e5d5c0 x24: ffff00000074f280
>   x23: ffff00007fbe6bc8 x22: 0000000000000000 x21: 0000000000000000
>   x20: ffff0000004f78b0 x19: fffffffffffffdfb x18: 0000000000000006
>   x17: 70203a72656c6c6f x16: 72746e6f632d7265 x15: 0720075207450746
>   x14: 07450744075f0745 x13: 0720075207450746 x12: ffff8000816ee830
>   x11: 0000000000000058 x10: 0000000000000018 x9 : ffff8000816ee830
>   x8 : 000000000000005d x7 : 3ffffffffffff000 x6 : ffff800081746830
>   x5 : 0000000000017fe8 x4 : 0000000000000000 x3 : ffff0000004f78b0
>   x2 : 0000000000000010 x1 : ffff0000004f78c0 x0 : fffffffffffffdfb
>   Call trace:
>    __clk_put+0xf8/0x130 (P)
>    clk_put+0x10/0x20
>    clk_bulk_put+0x3c/0x60
>    rockchip_pm_add_one_domain+0x298/0x4a0
>    rockchip_pm_domain_probe+0xd4/0x310
>    platform_probe+0x5c/0xb0
>    really_probe+0xc0/0x3e0
>    __driver_probe_device+0x164/0x1d0
>    driver_probe_device+0xb4/0x120
>    __device_attach_driver+0xbc/0x190
>    bus_for_each_drv+0x88/0xf0
>    __device_attach+0xa0/0x1e0
>    device_initial_probe+0x50/0x70
>    __bus_probe_device+0x38/0xb0
>    bus_probe_device+0x10/0x20
>    device_add+0x604/0x850
>    of_device_add+0x44/0x60
>    of_platform_device_create_pdata+0x94/0x160
>    of_platform_bus_create+0x198/0x520
>    of_platform_bus_create+0x1f8/0x520
>    of_platform_bus_create+0x1f8/0x520
>    of_platform_populate+0x58/0x170
>    of_platform_default_populate_init+0xe8/0x100
>    do_one_initcall+0x60/0x1d0
>    kernel_init_freeable+0x204/0x288
>    kernel_init+0x2c/0x130
>    ret_from_fork+0x10/0x20
>   ---[ end trace 0000000000000000 ]---
>
> The warning is due to rockchip_pm_add_one_domain passing pd->num_clks to
> clk_bulk_put, but pd->num_clks does not reflect correctly how many
> clocks are correctly acquired (it is systematically set to the _known_
> number of clocks, before attempting to get them).
>
> Only pass the number of retrieved clocks to clk_bulk_put by setting
> pd->num_clks to the number of correctly processed clocks. The value will
> be dropped anyway in case of failed probe.
>
> Fixes: d8b384777066 ("pmdomain: rockchip: fix clock leak on domain probe =
failure")
> Signed-off-by: Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>

I have already queued a patch for this at my fixes branch:
c671660ea0af pmdomain: rockchip: Only put clocks that have been
successfully obtained

If that isn't sufficient, please re-spin the $subject patch.

Kind regards
Uffe

> ---
>  drivers/pmdomain/rockchip/pm-domains.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/ro=
ckchip/pm-domains.c
> index e193f978d5f3..adc3bebcd928 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c
> @@ -854,6 +854,7 @@ static int rockchip_pm_add_one_domain(struct rockchip=
_pmu *pmu,
>                         dev_err(pmu->dev,
>                                 "%pOFn: failed to get clk at index %d: %d=
\n",
>                                 node, i, error);
> +                       pd->num_clks =3D i;
>                         goto err_put_clocks;
>                 }
>         }
>
> ---
> base-commit: 988117cc1bb17338c586a4e21ade88b5397eac33
> change-id: 20261122-rockchip-pm-defer-adb33313f110
>
> Best regards,
> --
> Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>
>

