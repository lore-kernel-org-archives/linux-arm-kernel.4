Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A28A606A8BB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oHV6DBTb;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Um4cZyH+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cx6t2YYr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Ud1KwhBJxzUmwkiA/rZSRNzFDb2bfZAFAs5A7HMP8WM=; b=oHV6DBTbe2R5WnfhmY4otkUM8R
	ZwKyTsILyHg0nfrHwqPlN/4PZdwbDpcklCi9V1XrbY2HWrSRyaOUp3dbK/WEwnf4J0ufwC17urqbc
	eHyVaYYHlwf1GERgFL9/tU/0PKEiP4EMyzKHc9QywMC8BSe9yQJkNi9uVzRuuzsuSu0LG5BDB6Pq2
	1qY+zdkIdQ1TbxfV9o8eeLqmECLYpZE+WW/iAVA5ewsDXHaSJhphPRZUW/JfzIA/KbJUfhWcKTsT5
	PH3IAcAXDylgqO1IVF2YEIih57FPsfisTR81Lf4P9VRwCQ3oMltOEs2gqUUuzFxHoh0zHwiH/v75k
	6iUo5xIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUj2-0000000A08z-1cWp;
	Thu, 12 Nov 2026 13:20:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUix-0000000A085-3nEQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:20:22 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7j2Av126333
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 13:20:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ud1KwhBJxzUmwkiA/rZSRN
	zFDb2bfZAFAs5A7HMP8WM=; b=Um4cZyH+RcAapiMx6tk9QyN4VzQ3CLV9uH1s5e
	q6OoZhun2/r+Nzu42OuwmUyH3sRAsD0siB6rlUhBJ+OKZ+sFqgGVuwZsOHYi5hDt
	X13+Yj1O1RShqE9NWE2mEKEwBDvB0ObUp3pBgMoSJDpO2pxIEUU5dymWvxHSWKky
	q4iXejZj2SkCbJWRXXDzCFuPriPgS+H8QIKcy0+95NauLnDr82Eu8VzDxqxJphQk
	2UXC2BOBCGPdoyOy6MXKbXyg99t71MdEAkGUeV8g8Ef1eWFu1+dHw1E6zlruGQTk
	DUMgT+JVVw2B+dVXXYiDhoqyDdJr3vd50j6C03BHyFnaKHlA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9a095hy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 13:20:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844cb60so187312485a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 05:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794489617; x=1795094417; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ud1KwhBJxzUmwkiA/rZSRNzFDb2bfZAFAs5A7HMP8WM=;
        b=cx6t2YYrmc2pM557QXWTIki83gHaKUO82e8xuj5hUh1dkiABPxWB7+KBqf8HJNU3BC
         KuVkEakJHDfhjQ4dikWRVgWXzbtQKohZS4L6rFizvRU6VzslMd1csNALVhMAzulmbaX3
         cbKC8pwAKpq4oFgE28N3hr+z/huilL0t1HmxOQ54mGgp+QCTBTReni7uNb4T3sxb889u
         ACG4w5SLjT0uLsiRE9pLqFoQ5CgQobYX4w+oddBOn5LppGcLpOohcSJNr4SQ0VBbb+et
         18Tt0NcicK25MivocBYvFd7y5pQt+BZvLaTiT9/CmhXBXH1HB7CxHaiBh8E/fQozadlQ
         A+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489617; x=1795094417;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ud1KwhBJxzUmwkiA/rZSRNzFDb2bfZAFAs5A7HMP8WM=;
        b=QBh5PzZEy15oi9m6n2JDdT9t+/xzJJowpplOTt25U0RtH5vPKxlMirwZq0LKa+m0BL
         g4lw2lB/15pDKeBJ5+iRe/YIYoepohwCDWF6Pz32U3ATraMktuIDdJfhTKaFBFi5CoRD
         PmFQ6a1A9GhPHBiMkaj3Qi3tvtX6UHeWzR/dYAjstvz4KqWUoPoluU/NvWxBny3ep25j
         H0ecau90WYCPRIN5xUaD39mdovbIL/jLWUYyedP30sSCGqIOlpzWCxDIF1dAIdrVZ1Fp
         aZrdOCrzi1QcORlYb1rWpG0uD1YCcEULZz/ulN8nMG3o1tzquwb01UOL7rVJnNCThH2r
         9PNQ==
X-Forwarded-Encrypted: i=1; AL+hErHIXiQb+f+0T+KMJpChsnrO56/5XuMCSAjhov76EaYvF1SgkMn4Vd/D3hY9+JK9VeouD0UTgYTHHSP1pd5kdyFC@lists.infradead.org
X-Gm-Message-State: APuU4Z+zpVovxHaBrl/saSfGf/bakDDUJ6Lw5H9jaB/B0K3ikoHjS5FD
	MWpWLP5VX8YtdTtjJQwIfB28eJM37Xjf25yiYUfcChzUSMmiioLfH4/ykvrKrsLAFnqUL8ZDFjJ
	/dqsyQqGeOth8BxipzTgHO8Q1CoT6lxX1PqDBv0IJt7NU8msBsK1V6ZRu2uRAr0ErPLq3JNYgn0
	jcPw==
X-Gm-Gg: AYBFou2BHg8sW8xzq3IZIN4ySEhnIZPFuQLXO1TlqmO6/gzVRabctSzI7BnjHJkiJx4
	oeR2TzBLo0mNSXvhQEKz1sN5x5Z7ftF3ywsWuXGTItfdFvX9nllgORO0O0lXu/PchLjjy9mlHGV
	yM4U9S/vuEtOQ+46nmtJqCmsjKy53EAVtsgp1co30nDLDhKMZ/4wC8oca2aThAT2teTK00xST9e
	7fOlGNtgxDISDkqu/fuJq+QnTBeiSOHuHHOt16IvOPYlRQmmMBTguxrWAAEpwp+WPfJe67farsk
	3CiS5WSAVqWORt0CvLWZDFK12gXvI3BsOV15tOi57dLLkg18JgteSKABZOYBleaqRhx/8yrsyYm
	N2KiRCFQSGMjA36dgnrf9vOZX0gwW1p/FRXptMhM3RuFicDYoPk3u7v3sK2ywbIypI/EH0J5VVj
	xKCsc3NPA/grXkr5tSz8+e4S/vcZxXrSx+fE5ZUO6xp2SbD4m3
X-Received: by 2002:a05:620a:bca:b0:93a:1196:ce5 with SMTP id af79cd13be357-9493310729dmr464010285a.33.1794489616774;
        Thu, 12 Nov 2026 05:20:16 -0800 (PST)
X-Received: by 2002:a05:620a:bca:b0:93a:1196:ce5 with SMTP id af79cd13be357-9493310729dmr464006685a.33.1794489616340;
        Thu, 12 Nov 2026 05:20:16 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a495csm16744366f8f.55.2026.11.12.05.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:20:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v12 0/2] crypto - qce: make algos optional and remove the
 BROKEN label
Date: Thu, 12 Nov 2026 14:20:07 +0100
Message-Id: <20261112-qce-fixes-broken-label-v12-0-7b5b9c7083ed@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAe99WoC/4WNzQqDMBCEX0Vy7kp+RLCnvkfxEOOmhqqpWZUW8
 d27tYceexmYjxm+TRCmgCTO2SYSroFCHLkofcqE6+x4QwgtA6GlLpXUGiaH4MMTCZoU7zhCbxv
 sAUtrfVXqwmMl+PxIeKz4e62/PeG0sGD+wS7QHNPrsK9KffBfEe9AgmyNcabwrXTmEonyabG9i
 8OQc4h63/c3Ic5wodsAAAA=
X-Change-ID: 20261022-qce-fixes-broken-label-e6aaf9624fe9
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Russell King <linux@armlinux.org.uk>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Birk Skyum <birk.skyum@pm.me>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4173;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=EwDtYv9Buv4+7yibwtqLU5DD3WUd5mC4sm0SNiT2HWg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9b0JnqM5wAUYNu2WkHJPkueCqCZKKegCm4TiV
 W6zS6UcNbyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavW9CQAKCRAFnS7L/zaE
 w3ZuD/4ht7rcv0iLK0QTLYcxmUGqmxhJXY9EYDH/fNilZxyaRCgNFYHRFVxO4K4IsEDJZqgioei
 R+qc4Bbd0Yq4IKEeFWpKgtTQfxwQKgJM5wXB/RqXUgEkyo8RBZgdDIxOroehAxEcLySlsE5qedf
 CL0XUdu1AYg9eF1VUMXcdRrV2GMG2mrOvSPUD2K7bw/YvJQUodnQMd5nKwZHUF5hPljq86nzGNu
 +exO0BExbOkKWij1351zihPY1licNMnBVOnVD1iSmQsvbHCA2qoBVtAz9q+sgoXwxnwFTLQxK0R
 ATNOvG/adpkO7ToRNCHTCVzjMoTRR/DLpXTqP2IHwiETIiGeLGbHWAtAqUHh0sYG+2Coz7DZNQ6
 zntWc7Y0Bl3RiqKuVAbIm5UD7kd9+PP1AcYHveTiZiYu9ENRDq/7QkpQt0xrSncPODtTJ/bwFSI
 B4n0jaJGeL4dzFf7DbHYcLdJQXaK1nHkr2ayPInBfGpGqpm3GDKy8iKcLTWfu8lJFbNdJm0LwM7
 v1MHkXe9gZFz7rMzXAPt10/GCSTd5n4ZUijLlINCpQBLWpBtnIE+6rHBLCMm61exxG9eve5ON62
 N2Thobas0cdhj5gvQzfgLEJJqPct9kudBc2Y95siP6AJDioB4brD2lBO+3tI0obTNNpiqpx8G9t
 QREFz4PwpyNXc1A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: IvuebZfIhiUKLmt_S8Nkii_Po0cvdXfE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MyBTYWx0ZWRfXyc9rf9R5598R
 ySTwvhJYWTSF0Wm0/a9ZLO3ualQUP3Lab9p6f+unzn6jT3CXIOz8KV8CZk63SMks+Y+2usmebKl
 /38Zv4AMNN7GaQgaYVX9tC/MO8dheSbYvAYZ2WEmtR7jPWq5aSApqdjZMJWX2B6aYC9UyWQaKfw
 rkVCuMUQux0e2n9xxcv6vJm6V9EtSIUyv3ismSIy2m/n91cnFrmoXGXnVKKKfOyO9MvhikfVDyv
 fwMj1XmhRvsmkqn2RTeO8w+bf9wDdy/22P9wnOd9wEZlgn+5f1+hGY4NeqImP08a/q3EyhKuUzO
 +nH4cDPxO/G+s72Hu/XksclLtsteAvMyuKKKTvnF3RROqoIJtCkbedAoJwGKizYS5u9jxHNMMVK
 FoqiGSJPA7HrOd9Z6aKMDR3IwKUPhS485864MulYNlvnz98nQP4yMApE07Y6sBO0m0pTuzW6HHI
 C51dnfLrcrwn3sgIKmQ==
X-Proofpoint-ORIG-GUID: IvuebZfIhiUKLmt_S8Nkii_Po0cvdXfE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MyBTYWx0ZWRfX70KUrUs3Tsdk
 gQVML0DkMKGHWDih3APZg+Lq5VQDZViiP6Ic/xvhuCPYNO2AE07rGV8ZMQjsov6OIvQqSSr5BYR
 OD/N2kh+Ruz0IxJxsczn1ZkyPeAVHLU=
X-Authority-Analysis: v=2.4 cv=COG/zhrD c=1 sm=1 tr=0 ts=6af5bd11 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=RPm8042193-LcWM-IooA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052020_105190_3ACB1558 
X-CRM114-Status: GOOD (  22.77  )
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

This is the follow-up to the three smaller series fixing crypto
self-tests in the QCE driver. It makes the crypto algorithms opt-in via
a module parameter and removes the BROKEN label so that the driver is
built by default.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v12:
- Add module description in patch 1/2
- Drop dependencies from the series as they're all in linux-next now
- Link to v11: https://patch.msgid.link/20261022-qce-fixes-broken-label-v11-0-0d33c34fd0c3@oss.qualcomm.com

Changes in v11:
- Split out the patches making algorithms optional and removing the
  BROKEN Kconfig label into their own series
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
Bartosz Golaszewski (2):
      crypto: qce - Only register algos if the user really wants it
      Revert "crypto: qce - Mark QCE as BROKEN"

 arch/arm/configs/multi_v7_defconfig |  1 +
 arch/arm64/configs/defconfig        |  1 +
 drivers/crypto/Kconfig              | 22 +++++++++++++---------
 drivers/crypto/qce/core.c           | 13 ++++++++++---
 4 files changed, 25 insertions(+), 12 deletions(-)
---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261022-qce-fixes-broken-label-e6aaf9624fe9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


