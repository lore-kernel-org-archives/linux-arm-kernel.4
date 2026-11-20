Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FBF606A6EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 19:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=an8Io23c;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LseF7q10;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RxnVnlPp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dL5qrymGK7O2V/TlXMiVhWk57sq0Wg6NLH/zPnd4phY=; b=an8Io23cktBmrj
	//mXEQ/eCQFQ/B79lhRNJqSQJFsLkzziKX+MrXNjS1QMjuw/rD12xjBC8Or85zVoT2D9xAOnxXm0l
	LJkpg6YrH1wy04R2zB9zAZa9tiL+5XAASvBvCrePDlfXUIwfAzXrjOmpcQxTE3wmJHo3ke6/9vjMi
	cCI0wjvXWAmRDSAQX8IRat/72gWYzN3Cjg/eaQtudWsoMdfcP7RlbO1fwe0rN/YFVnEsECIu96pcb
	vogIKTUsz3tg20iDnEaGFXGgPLqPTifit8doMXqFi2a7dTAGn/pFA1A1ERA+lfJOpv9stc4GvePef
	cNiwY7U7j1xyO9TRPoGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUOt-0000000G6hS-3mBL;
	Fri, 20 Nov 2026 19:35:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUO8-0000000G6Sh-3fOR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 19:35:16 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKGFs7U3830196
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 19:35:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dL5qrymGK7O2V/TlXMiVhWk57sq0Wg6NLH/zPnd4phY=; b=LseF7q10Yx0HSNMi
	Hv0eYmithUeK60i1eJxe2XOogdFyikPL7D+DwgwA6DsjXOrU77m1Sq2GMWfFHuQp
	ByoWaJiHBNquvMU3eU2AWBxkI0mUulbgYYXPIKgjXNkJnmFsqvczd1JxY2qDdj8o
	ZNe+DY0wf5UXI+qZI5ZivjQBdObZ9f+X3Loai6Pg/vfCK3NCGTbxwiFG3sZDhP1X
	aRHJPiBnvASughAXzUWfWojG4KIhbKf7i/il+gMeU2RNAnsh4jWfBIkRJ4IurQhg
	JS1QltTyvArU202mKhqgeV/PyIv1Sl3Tf/EWjRxwCxLSi0ubazge3bflzPwMiqTR
	NQvReA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2sjwgw8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 19:35:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-948d83322f6so221780985a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795203311; x=1795808111; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dL5qrymGK7O2V/TlXMiVhWk57sq0Wg6NLH/zPnd4phY=;
        b=RxnVnlPpGaZlOhnrVU3a3JkNnmVTW4LOFnOW4eUykU48VEeCDez6AS5cjP4v8pn86a
         DpfqEwkZEP2QwpVglPNsl53U54TP25kDZDhnWl5fof5WUH6ij8Rt6e2DhZ2M/Jc+ekWR
         6BO4sGTBa7sHhBu685qEMJwY75TDBAhg7ZSaJIA4Lpi/0zgeNVshTzPth/5ltjE4g0tf
         297qE5yiFXWWgO3JM0GA0EW9K5DbYZV6zmehetdsnVz35XbnLbAJu8BNq3FqyPM6vr2A
         8nX8V0GOsy5zh1Rw9HrcMsTUcCf8NSW7YJYphkduiHlVJ7MI2Y5U8V2MnmpVu/b+HYKy
         AZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203311; x=1795808111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dL5qrymGK7O2V/TlXMiVhWk57sq0Wg6NLH/zPnd4phY=;
        b=VRKxaE8pqo13A+zVatc7WHVAlySVt6q3a8FLhoQr+bkMWYXbWyTsXkz5w5TxGViUEA
         Mxb0z3qDyj2Ipzd/csdwPbxQPxdiDe395okt6ECSZCr4cZAcTpxceB6ayPZxI60p6Jak
         tZtoZPXBBKh4GwMRzwbmkOxrRx6/JDtLsnm4nVFrDTojA82LHbGmm5gRYhLdql619jbe
         cMptZbVbcaPkiYM84kEnJD57Gz78OKRutc3GLpHiXheYvpzSg/NS689ixf6GuiDGmcEB
         nQC6Fk3IFBM0Whrwu4HfY5s63bj3/y1SJbRW7MSkEJtm6buZMjj/pMysHaSiYX8OftYd
         Nd0w==
X-Forwarded-Encrypted: i=1; AL+hErHoWQ3DfrD0+7txNs8BDCJSviS4jlPzM2m1FX7LU9xyuHwOEX1T6PH3C5nGdndtCOtZD0vujhi8O8AqWAW2NoSL@lists.infradead.org
X-Gm-Message-State: APuU4Z/RnrscT4DJG98YrkqulN3kdOdsc7Uo8j99qiSmG6DQDBsyrGVJ
	VW+xwfSrtUJL8diexTgGHlnj3/S89dQfegSIRdPjLWZp3uQ6bU2i8tnK8nSqLw/Pu09ejvyvqOQ
	fz5oi9qzVZWfAbgaPie/WU1jJ1a8D12Ivfz978IjOzxESGPqZ81n7ya51rTj5dZPvI3flBVfyi6
	T7uA==
X-Gm-Gg: AYBFou28gINDV7GmFk7apQsbQE9u1DSGDRM8s2cv0lkSbLurfhZXX6dKefR1NcZm7w5
	FVK2FaCqZ4CTq8E6xYwaszgSAQ5rRCV/pfeakTLQhsYhv7aow0/t0w4PCtj9TUuAwgXZK2ZVTt6
	cYFyL0cgeiPwzR4htOo7t0yubAT9pQTh3EHSjwHOVBAcoNGJaxMvNZ3/6VFCt3a9RHhT2Q31wNO
	s2cTcBb80ND3iE4+X7r/oFgckSiC468tLHLV/6oQAohw153eNxPc0lCbT7MfCIDWQ22E8eXwBWX
	cMXzzM9m4R4sZxwy2ZeV5+SM9fw1wK1BMOVF+Nj+ydJtKDKMnn6RxJC6MGTKLMNn1Lw+g9zWH7F
	20oxw+Jf+uRNGdIjCgTJZyHdrA4IS4GMZ+uRIo4AAxb9jm8jZLml2bicqEVopfng7WV4AjrjzcE
	k/
X-Received: by 2002:a05:620a:2a12:b0:93f:1d5:9973 with SMTP id af79cd13be357-949bab5a6a2mr648559785a.73.1795203311186;
        Fri, 20 Nov 2026 11:35:11 -0800 (PST)
X-Received: by 2002:a05:620a:2a12:b0:93f:1d5:9973 with SMTP id af79cd13be357-949bab5a6a2mr648555585a.73.1795203310736;
        Fri, 20 Nov 2026 11:35:10 -0800 (PST)
Received: from brgl-qcom.local ([62.245.128.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm6806343f8f.20.2026.11.20.11.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:35:09 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 20:34:56 +0100
Subject: [PATCH v12 3/4] arm64: defconfig: update the Qualcomm Crypto
 Engine entry
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-qce-fix-self-tests-v12-3-b5a2a44bc5ae@oss.qualcomm.com>
References: <20261120-qce-fix-self-tests-v12-0-b5a2a44bc5ae@oss.qualcomm.com>
In-Reply-To: <20261120-qce-fix-self-tests-v12-0-b5a2a44bc5ae@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1275;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3i3hdwFui/8ynH47JNYu7VqIYczjdvme1AY4IJcpfg0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAKDlAWUz7MHSnecvkIFD8fzhr78XWyGqTiqFp
 ba6dRuHuFyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawCg5QAKCRAFnS7L/zaE
 w0QGD/47iqPh0erUxpbyfM/v21ZsiKW4cVcUfs2IqyRlfHRc5SzLO0mtLaz5LB7MedcpOhE9QEY
 iflgwSDDEmM+mz7j7i8fLtuCvCgTI11KDajRLFCoc+NW3UsnLRJZnl0CabUcb79OXJmNgWxy8lG
 tqRyaC6eyWhVlmVFwHAT+1e1TVQyOJ07mGfcp3m6PCZDUrFmJQawmfJmSMyPX4BdNbli/3Qzav4
 r1tDg2hK1n4CmgArmOTwEdCb/Sxbo0xq40yX0HjnVhNmm0DKll6MKBTh0vUAFrWc7bzlfXG3K5f
 srXIiqYIEmjXsOEATKEjqdP2CSd150YKi1mq3/eHL3zmvyGjgWk835y1DmqtvjTH826EDdkG+3y
 6CeUHNdC78aMVYldot1iia8S75OikmhaAbzpOp6bLYaCaIwavutP7rCbHbc4H3quvZJOzCjTmaI
 lhXwZFMV8zRBNRHVNR8Dha1NCnJwc3Uyvs60+M7aLRV6zGhl3v0EFZRvkRipCFFRfXdX/q7TQ7G
 fLnpeW9nBP+a89DJz1CDFjhLDNLBqf/eu+ZWUiFMj8sIsa6cyCgOJSwS+bwETqDttqwbB3eTxdw
 zQe2biR8a+XHr4BrLfHLPZxeMBfmmIxJnZmkcaA68nG+y4GqFJY/lHzv0tMs2BM0hPlQke5goUh
 Ttbiw4m8FjdMLlA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: IffyAWsMzl6hgQwkOBAnePwka3F6PV1a
X-Proofpoint-GUID: IffyAWsMzl6hgQwkOBAnePwka3F6PV1a
X-Authority-Analysis: v=2.4 cv=dZ4VTnXe c=1 sm=1 tr=0 ts=6b00a0ef cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=y0NJeVxnVzJs6a3GlOz7RQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=5AW58fNYxLuDjIPvRSgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3NyBTYWx0ZWRfXzcvr7TaRZ8Fn
 oAXe8F9q7ozVEHgDo46IS3oZYkzH3tUcN6TpPMXOvGlC7JSewDfutevWbxjEL+qF4EulXr6gpSz
 /Ra6SfR18CtUhijsi5OPgfadonZnx5E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3NyBTYWx0ZWRfX7g62aNxfwrhD
 qbnyxZWq4VzWDH8lxKlWgXnBzHd3e8/nWuCOZsgq9/NFLnQ7laLX2Hlg5X317jUfWlaPwzvXTsf
 4Uqf3Z4QyfhDk2K4VLtS0krOU0Kr4Ytdiw+v41/LJdc2zgZN/aHnGF1VtKlX+khNt86+EV+FuXF
 mEx8RPbaJJRYq7X4QFlp9oOtGZ9Kmbe9BvE92zS7eSXyabNFVWaqXo0+rvYmFniSBRs+qZiniTa
 cchkLRq+MLWeakUXcIZlNMk04OIKW7tAMpupBPLBqZNpWu0OwaQM20F9uWKDjUHfYWyBKh/i22i
 n1cKOvZuPDQs3REr6u7lWIZCNdfzallLFGbqLca1Wjj2Nie6yJZo2ol/rcz0Bjgjs/xKATILN7n
 OJoZ+2VRrEwtYNEu1s02bTvuaGTdg6LhwdXrFSOjbkj/5ZpfeCcuEWUgISH2MJpoLrcpBDQYKdO
 zRFV4QaDP2F9l426Epw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_113515_404260_78FEDCFC 
X-CRM114-Status: GOOD (  15.37  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Most Qualcomm SoCs contain the QCE hardware offloader. The crypto driver
for this IP is being split into a smaller core stub that doesn't register
the crypto algorithms on its own AND an auxiliary driver than handles
the crypto part. Update the arm64 defconfig to only build the core part
by default and leave the choice of building the crypto part to the user.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9c5b64f34a228883a216cf205181416ac2f95edf..1e0a7b81c738f62367df0ed59c005ea1500714cc 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1553,6 +1553,7 @@ CONFIG_MTK_CMDQ=m
 CONFIG_MTK_DEVAPC=m
 CONFIG_MTK_PMIC_WRAP=y
 CONFIG_MTK_SVS=m
+CONFIG_QCOM_CRYPTO_CORE=m
 CONFIG_QCOM_SPM=m
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_TI_PRUSS=m
@@ -1801,7 +1802,6 @@ CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_DEV_SUN8I_CE=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
 CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM=m
-CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_TEGRA=m
 CONFIG_CRYPTO_DEV_ZYNQMP_AES=m
 CONFIG_CRYPTO_DEV_ZYNQMP_SHA3=m

-- 
2.47.3


