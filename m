Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB889606A6F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 19:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UWGn6C9A;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fdC+1SgU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EKtgocwY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=NikyEkn2Ckik4aNGE7wLG28YXcgo+vx8KHG7eWoRnWE=; b=UWGn6C9A4ymWt5BcbzbaVv5Hqr
	6SCMMoPq6CgLWLWJbfTuFnbNCTXlsiM+NCaWz8IaENNTWxAOJCqncDCY54MqGoY7UFsYAvUqlFV6d
	XC9JtRl/DWi91/eA+6uxIdulJ5Ajqs46OZJBPNVuH8MtzgibDP+DcSv9WgCxD/8r0SC/xOXZqjApg
	u4vDZ1QOBwe9/JTREVIEe6hSX4AWTLC5xNbMKmDvd8A3cuSTt8m5q967/s6K8p6OPqN7Mh2J/dBOP
	8r8mI24w4J12uWcwjKORVHGo7n0jxgcozRO0XNPA+fXDFWV+EBEoYgTeVJ9J4vd2Lr67vrvt5R4Q+
	2T8MM51A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUOB-0000000G6Tm-30lz;
	Fri, 20 Nov 2026 19:35:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUO5-0000000G6RK-1bbx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 19:35:11 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKGFsaD3830175
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 19:35:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NikyEkn2Ckik4aNGE7wLG2
	8YXcgo+vx8KHG7eWoRnWE=; b=fdC+1SgUVo3ZJ+Q9pVZdg1/C+ZwBMDFDwT6pZb
	lc5EsU0ViuA7M40Y5na4t1ukO//FmM+6OnTyTiytcwDPHGNyjSgkb1/vJcmrs/Vy
	212Xcc8hKD8urVrro6/GoX83lhOJ5GNb8ShOVuwbsnzb/J7twrt+GyYyEUspZCxv
	SZrtayV93C+mCxvZ25lXwl/QYz7slip/qWiIEYymXHxqPshtRJSRj/kfwDBiuMRN
	yxG5Nwj1NpVDzY0Jb4rNU5HeCWKq1PmultyunQpHunTk6O6f57VZaYyXxL7Q0UUr
	FhDM+a5LHsa2UFOdG+fkNWg7ARNKM2aMX/Py1CrYdd74p7+g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2sjwgw87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 19:35:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f3969a2a7so203228385a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795203305; x=1795808105; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NikyEkn2Ckik4aNGE7wLG28YXcgo+vx8KHG7eWoRnWE=;
        b=EKtgocwYx0cRH2mGmKG7SpW4DfJxFSVH41Ta+UZaT16hpvZ30jwhk9npsf0ASkyli3
         jA/BG0HDO/6NWMPR4gUjOnqszH+sdacDh0IWi+P4vFWPG3qZwFkKzdmbJna4JjqN8c9b
         xEieqCanWkEVB13Hf2mO3v7UuAcs891pWifQck9kRc69GTlgomujp2zc1gRy4wsZ7bgF
         4bTCQR8heCEguUbapZrHWPcMVp2tWPD0gCB2Z7XooFnCKHqBBg2aFUbFdeRWRhlBOY+F
         mx8hq3wMO2RN7x3B+Vt8w/Lv91qQ7ahYyWvudMTte/lnKTnTZtJ+Z9NLcWXH+ediGFkx
         WpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203305; x=1795808105;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NikyEkn2Ckik4aNGE7wLG28YXcgo+vx8KHG7eWoRnWE=;
        b=eYeWZvhX9l7BmGr6iTalNThw8C4nIGSYkuWfFVCFYpGOwYO4wIKXkj1BAwf7LzXFiP
         OTJlPFyhR4P7RKtf3NyBMK96t6r97pkH2/s08isVR4DyhTBYRzbg2NxSgFIfk/NBMTqs
         tDM7LydVTRGcbgcQslB05Upad1QhsvJY4tuCKLwdHzmnCInMvjRR9GOvPPU+oV6SGHBJ
         s77BR5hXrfjzL0CQyZ5iAKrXnXWl79g/zOEm5cvbCMwcFTaKHTX4GRKjqEZqE+BTwe86
         o+8w8G+zOEajjzctll06J9VvWxZ2TH4IoTIB9qYfxLnHx2FzS3T3E01X3YVUpF38O6gn
         pJBQ==
X-Forwarded-Encrypted: i=1; AL+hErHie2Qm7POzDsTRPCNNYt56CsrHdV0GAqZxEs+xzcev7Jo355BMXinN17DViRFxCknfXkdXBXXuv5251XVpFVwL@lists.infradead.org
X-Gm-Message-State: APuU4Z8vfG0GMe3JKYqcEPR/xzorhT/se7gyVytq2Wd8sWqjigPGuBsX
	qocJtW24A96S6y5bDL8qR1lzXtUtP0Z4aBH7NDs3OebGxEIIGvLvPcEIXxGa4VxGi+IfCvcM88a
	WzNcBTuZpMMwtpxpJTR0gUMb1H7aSm7DyJ+kFqrZUYMvNqfbct7eijfKL1Q1hfSeaef1lVachK4
	h1rg==
X-Gm-Gg: AYBFou1mMjD8khQzPwKAZ3LnW+0dpi10YP+4LpGtykxeAlj3Pam5LnJTzyO9s/mOnqO
	UDmzIofwmGnc3gCwYKljKqqOYaqp8XCJXjdOcXPso4WGi5Cn2rY+YBjX3kysuB6aZ8fJfZOdDB1
	CYCRHMwG1I0cSkloX8KDlz/RlRgAimTPRs0xvlKsb7CpBP0SOZZlMrBKCMF3tY3cYJeoUMzlvCZ
	w1XoMRiKG0V2K/rKG4uXfyfUtwDKxftNEK0urdrM8uryUAOs+EMZ22WvLFUgw7PW6BxXmopvUPP
	dNkbPJW+Npbp+gIB+LviqprQuxqPmGVMXKCEyfi2JumYYz/elZS+wB59afgGExoNW1MsQJi9283
	Zd5VKFzrcQljnvbo3uoInTCWDPY2IDHw4c9vBVGk/hsMrOjnFtvOpRVK0kUHFduaNBSh9t2i0ni
	74
X-Received: by 2002:a05:620a:480e:b0:949:816f:cff8 with SMTP id af79cd13be357-949ba823573mr720708685a.3.1795203304823;
        Fri, 20 Nov 2026 11:35:04 -0800 (PST)
X-Received: by 2002:a05:620a:480e:b0:949:816f:cff8 with SMTP id af79cd13be357-949ba823573mr720704185a.3.1795203304333;
        Fri, 20 Nov 2026 11:35:04 -0800 (PST)
Received: from brgl-qcom.local ([62.245.128.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm6806343f8f.20.2026.11.20.11.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:35:03 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v12 0/4] crypto: qce - Split the crypto driver into core
 and crypto parts
Date: Fri, 20 Nov 2026 20:34:53 +0100
Message-Id: <20261120-qce-fix-self-tests-v12-0-b5a2a44bc5ae@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN2gAGsC/3XTS27CMBAG4KugrGvkmfjZVe9RdWHscYkEpMQQt
 ULcvQN9kIW9iWQr/jJ/xnPpCk0Dle55dekmmocyjAdeAD6turgNh3cSQ+KNDiUaaUCKYySRh09
 RaJfFicqpCOUx54SUvdYdH/yYiN+4q69vvN4O5TROX/ePzHjb/eN0jZtRSJGiB8gQQlL4MpayP
 p7DLo77/Zof3U2d+6Vkq1LPEsWIG5UoxZwaklpIiFVJsaSy46DBgommIemHZKWpSpolZ7IykDM
 49A3JLKRGOnOrSWtrdSadTWxI9iH5egNny1JMm4QWXMigGpJbSAhVybEE0ureOuODbfXOL6X6H
 /csbfgCWIVkfcgNCeQ/BRL6KsWppdDcNwy9C1q38gE8LIB6WQC3upwJRhNZjlqxrj9DMNHxzBN
 1+p2E6/UbvvMQ628DAAA=
X-Change-ID: 20260610-qce-fix-self-tests-492ffd2ef955
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5365;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KTZtNkn180IMQ7q/xXo9jGDg6f/6/gZiWsnPOSwb7LE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAKDkMgMOx/M1Q/T0IUCPzD0uz4f0ZMpVr5AxB
 1pzKZIRf8OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawCg5AAKCRAFnS7L/zaE
 w4M5D/4tEZWCpTfdDXReKGXBm48pn5Ho8i6GNuJFo2iU7XqMGO4KV2//FkufCsjxUhXUmZKKlvd
 d+/vzPdf/ft6Sye+tB2sniYIw61iqBy8bYw5lcAx2LAKkW3Pm0Elz5OP6rkEmNUrMtGdyxlQWMm
 kPXj+DHjQFTvz4EBxrUMO8iIkHEjvxvqn+STZpFNJpUCctKJXH34bu4bc/teVZA/7Ym0YbWsBLT
 lVikm7n4fObeDlXhNS8tj/9h5mspdsTNeJubk+Sn083IB0uSNRDRuLmS7yxdLHEP4TC9rP5p3Bq
 AyyEviT7TuXJC1vpv2mkEDwQvh2949kSfJl5NWgyzwhsYDKYn5u73akLTZHKPOKIO7hbBAswgKf
 HQ04E5Z32e3XzKSHb1wEzB/W2tdys7oN9SsIt4GYjNfuhB70M5jpno8NHfPOY7EV0/YHQukhePN
 rKCmON+gw6EODEI+xcJobaeJCmtjgfRmquB024Shw+41GnN91gfPpRCyxs1zYRVQE0pCtCQJ5S7
 KvWIL4ubH6nEfW3ts6Knc54CtvvbI4Atf49f+mCO8+E6DUS7aH3qaZFf03Z0Midn/852eKKJvF8
 95EjGRmbIrUKa0JucqPC/UipJ+bhkSZ2omWTzJ4pDUtDv3U18IjYmUDAAbcm+vVt3nnAEi/FkB+
 /wV5ISl6fnN45Zw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: UhjqSvPq8IxuUW1koP02mfUmfvzqOobM
X-Proofpoint-GUID: UhjqSvPq8IxuUW1koP02mfUmfvzqOobM
X-Authority-Analysis: v=2.4 cv=dZ4VTnXe c=1 sm=1 tr=0 ts=6b00a0e9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=y0NJeVxnVzJs6a3GlOz7RQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=wzu_yjjtnJo_jeqIb-EA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3NyBTYWx0ZWRfX9/uaiO+5mZze
 dKbMv4r+AyccRm7X0ApCBWWYWYFJFVb3AdIBu5WU6uE31GZfrSlWNIGUsqu25MHbc+c5yyBkO90
 +2TnYy4PxhJm4UthtwR7np0INJmMcvw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3NyBTYWx0ZWRfX6+gUfmPdNd15
 OMyANjVu1pbze0V+RElSyJarQYZRxroevIPQsUZzx0iK2ac/O0jvFZ70mN8EqxRf/6PKXXp1NmX
 m8+QfvDiDrEKnhcdtXy54SldWqsm4dxKH/Wpv4TGN96P5W+liVOqg4v++E1hbyhElMHpbTT3KH7
 DVyieGHb5qp6VRXTlRrLbeB9Psy+IUyyeLm9t7J/iNXMeYAET8MOO/A9dT4jT2wsxmf7Ef/c8+9
 WMn/2s0R7bbiTuoJDX5+TII/lIzhnJkQ9zWkIvcTrBy1wA9ZXoM6uWkbXKfSvdufqM7WPfEAjmP
 jyNFJbcb9pZi84NT6wJiFsKWdc2mgMQL4TGW4Y1+9/KZ78G8atCwmlDw2YXgHxUwuYivEZrko14
 9oDNFKJP2AQVYHmNIj0CBHlHBnERy+V+Jd3nKjVzWdihMyZjwQB76i0dYDUAiht8j2l5xc9vkY7
 +AHAPNeT2Ux2SnWUmjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_113509_669285_F7E59D9C 
X-CRM114-Status: GOOD (  25.55  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With the self-tests fixes queued, we can now split the QCE driver into
the core part necessary to bind to the QCE DT node and enable runtime
power management in order to allow to drop the interconnect votes, and
the crypto part registering the crypto algorithms. The core module is
then enabled in arm64 defconfig while the crypto part stays disabled by
default. 

Merging: Once the fixes to self-tests land in mainline, this series
should be queued through the crypto tree with an immutable branch
provided to ARM-SoC and SoC driver trees (with Acks from SoC
maintainers).

This depends on the final series with fixes for the QCE driver:
  https://lore.kernel.org/all/20261112-qce-fixes-broken-label-v12-0-7b5b9c7083ed@oss.qualcomm.com/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v12:
- Correctly check the return value of __devm_auxiliary_device_create()
  for NULL and not IS_ERR()
- Fix a comment referring to removed ICC code
- Assign the auxiliary driver name to the auxiliary driver structure,
  not its embedded platform driver
- Link to v11: https://patch.msgid.link/20261112-qce-fix-self-tests-v11-0-b86a65ee7107@oss.qualcomm.com

Changes in v11:
- Rebase on top of fixes queued upstream
- Drop Tested-by tags from defconfig patches
- Tweak commit messages for defconfig patches
- Link to v10: https://patch.msgid.link/20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com

Changes in v10:
- don't pass a NULL buffer to sg_init_one()
- fix byte order of the imported hash state on empty finalization
- don't recompute the CTR counter in software for every request
- reject skcipher requests with a too short scatterlist
- check fragmentation for empty CCM decryption requests too
- don't use a static loop iterator (duh...)
- initialize the return value in qce_handle_queue()
- Link to v9: https://patch.msgid.link/20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com

Changes in v9:
- Rebase on top of cryptodev/master
- Rephrase Kconfig help text changes
- Link to v8: https://patch.msgid.link/20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com

Changes in v8:
- Add a patch making the crypto driver *not* register algos by default
  but only if the user explicitly requests it with the provided module
  parameter
- Use the "offloader" name for the crypto IP instead of "accelerator"
- Fix device module table issues
- Make the core driver use a list (despite it only having a single
  member now) of child auxiliary devices to register to make it clear we
  have the intention of extending this once we start the work on secure
  media playback
- Link to v7: https://patch.msgid.link/20260910-qce-fix-self-tests-v7-0-cdbd2718af14@oss.qualcomm.com

Changes in v7:
- Add follow-up changes converting the QCE crypto driver to auxiliary
  bus, adding the core QCE driver under drivers/soc/ registering the
  auxiliary device and removing the BROKEN Kconfig label
- Link to v6: https://patch.msgid.link/20260717-qce-fix-self-tests-v6-0-455775fe5f6c@oss.qualcomm.com

Changes in v6:
- Handle all zero-length HMAC finalizations (like imported state with
  data already hashed), not only the genuinely empty message case
- Add an additional patch addressing the fragmented skcipher payload
  issue
- Link to v5: https://patch.msgid.link/20260706-qce-fix-self-tests-v5-0-86f461ff1829@oss.qualcomm.com

Changes in v5:
- Dropped patch 1/8 that's already queued
- Use the pre-allocated fallback ahash for HMAC transforms (Herbert)
- Link to v4: https://patch.msgid.link/20260622-qce-fix-self-tests-v4-0-4f82ffa716c6@oss.qualcomm.com

Changes in v4:
- Remove remaining ECB and DES3 bits
- Pick up tags
- Link to v3: https://patch.msgid.link/20260617-qce-fix-self-tests-v3-0-ecc2b4dedcfd@oss.qualcomm.com

Changes in v3:
- Remove even more algorithms and dead code in patch 1/8
- Link to v2: https://patch.msgid.link/20260615-qce-fix-self-tests-v2-0-dc911f1aad42@oss.qualcomm.com

Changes in v2:
- Add fixes for the full suite of crypto self-tests
- Add Fixes and Cc tags
- Link to v1: https://patch.msgid.link/20260610-qce_selftest_fix-v1-0-1b0504783a46@oss.qualcomm.com/

---
Bartosz Golaszewski (4):
      crypto: qce - convert to auxiliary bus
      soc: qcom: add core driver for the Qualcomm Crypto Engine
      arm64: defconfig: update the Qualcomm Crypto Engine entry
      arm: multi_v7_defconfig: update the Qualcomm Crypto Engine entry

 arch/arm/configs/multi_v7_defconfig |   2 +-
 arch/arm64/configs/defconfig        |   2 +-
 drivers/crypto/Kconfig              |   2 +
 drivers/crypto/qce/aead.c           |  12 ++---
 drivers/crypto/qce/core.c           | 100 ++++++++++++++++--------------------
 drivers/crypto/qce/core.h           |   5 +-
 drivers/crypto/qce/sha.c            |  12 ++---
 drivers/crypto/qce/skcipher.c       |  12 ++---
 drivers/soc/qcom/Kconfig            |  11 ++++
 drivers/soc/qcom/Makefile           |   1 +
 drivers/soc/qcom/qce-core.c         |  92 +++++++++++++++++++++++++++++++++
 11 files changed, 175 insertions(+), 76 deletions(-)
---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20260610-qce-fix-self-tests-492ffd2ef955

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


