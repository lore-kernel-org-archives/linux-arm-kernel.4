Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3FE606A88A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 14:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V5afqwrz;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G/B5sSIj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q15wG11s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=e4ZL0wK5kOGxE1Y7tPHBLyOAOezqxXQy3eNKnfQ9p0s=; b=V5afqwrzo6spLCxVYnOcqocAKi
	QqBvJ+Oq8ZhqEktomABAYQYo5Rj9E6pR89/IrFgiWY9NoGLYSjG0tDtbg4350w2m4dhS2b15aFREt
	x92fYQ3DtvdDO5FzkTYTQXS2PyjkmdgEY6XYpOD0GNCrBGRr8KWLrtuWzKVkR6cifvobsC3ewwL+5
	PblDikNVA/YDDrY5jST8qYx4y/H+yVkubAaZBu6x68owz2tj5nWIzSjHDUQT21ibjyenFSh061b4E
	3xkkVqyFrLLzniNzpPbAzRYZMjn0ud2tMfZ9932q0VpbdJHn+nX0w97FP5xZ2EIDdM/3EPtn2GjUR
	eBUe5zNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVVt-0000000ACdH-1oAA;
	Thu, 12 Nov 2026 14:10:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVVp-0000000ACch-3XHB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 14:10:52 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC90vB12514210
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 14:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=e4ZL0wK5kOGxE1Y7tPHBLy
	OAOezqxXQy3eNKnfQ9p0s=; b=G/B5sSIjB1kFdW+mVxpGnL8eeJFe535kOxnL/j
	FBziMVmaz0o/uYGoKtlPQ7iPeRXFIFBMNYoLxlBeJF/1U2pSeuzeO7SSbA6zk4/r
	2Rx2LLjDYmg3Uk5CmOegz0SecOsPAbEmJG5AVkNcO5iq6e45q1oNWLxnhMo8mcmd
	uoCAyeW2SRrJ4CH2rhsWcVKcmU9dYlMd/b1ZituXlnOKObJT4wgDQwg3KGXAXSLs
	5evgP4CxR5207FguH8s0iY4wGihOB1RkDHLNSzksh0GMh/aZM9yzKooMgrMsztl9
	DKORxCGKj8iPBj4A4wM8Pf0R2ZzdLlsC5m57utaQekzZbtag==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1uw79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 14:10:49 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d2e7fa9fbbso643961137.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 06:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794492648; x=1795097448; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e4ZL0wK5kOGxE1Y7tPHBLyOAOezqxXQy3eNKnfQ9p0s=;
        b=Q15wG11sZgLlkfE85DjGFMM3cakVriQQiwIQINNYVhk2GxETaSr0zBPuDPDQNDRu8u
         Cz0lp7cGTBjKnI59M/s7lgypMRLBLqRWOTX+Gqw3L8HNFyCbo0JpALtkRFRLMhPr0Rq2
         HSKgIuUkgTOfdu75dEUNebrda2slY+KUD1Oo+VjhCq6n+3vtRdDT2b5kBTqDqVZDLKod
         VYEvRTvKszbDzA7ULHzanwE+NfLehP4xwACwAjhSIV35aXE17YmMNjb6VC7bhJQYg1GD
         FcEciWzD/IAlcRFZQiFg2Kv7AJdRFSkxq35B5CKI6SIuQtfMlE+tfa+Jvyqmq/4v/yZ2
         bGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492648; x=1795097448;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e4ZL0wK5kOGxE1Y7tPHBLyOAOezqxXQy3eNKnfQ9p0s=;
        b=tegCB56kN5SlA7kTWe5lD5ZU4JYnsQIQ3P2VgQaioK6TXpk26iFhF3c944hHNSKX9W
         9UBpbVx4XJQUNqSHwbLRtBaHR4rKqnXcPYHrgNOwUFLXt0XcQLhUkLpP4Q/awkm0gYO3
         yxHY9ocKN4BIoNxIb2uSr7sG86Yyb43jJMSGe+CY/gqCPzYH+rgO3h5u86rL0HTVOdZM
         qVsAOg1EpSlBxe3fPAr9XUpgP8u1thUICaVZ0RGmRJAXJLfFkisxirkFy7D3inbOwOZz
         QXwuZnAc4MX/Ayc9I2HPnncRrhltzaU0d9jQGnknR2ZTxkF9+171cIcABMfohWE0fxHS
         gZcQ==
X-Forwarded-Encrypted: i=1; AL+hErEcxBy5c+/7H6j4Z2yhH7aH58/resfuNrLcfnufKGpp0OoaLMuNynnBoX8E9TCka1nD7uM2dWJaAUJ+t+2Y0StW@lists.infradead.org
X-Gm-Message-State: APuU4Z+FJXgFcYXVhWC6+SO3bkeC5YAQNx/JAts7CYa2zWw5sTYHKzqY
	G54lpl6I3bTiOzPzjjMHgslSgQpfLQocf/0hQdYG9FAgA0y2P0XRaGp159v4B+qpnL5FXVVMebU
	eL6GXcd8kZOxWE6Dk8E616SJFBZeSt5COVmQrOXpz/TzkzKHovkO70KdRT9rYAt5OIDvsmt+tlD
	sPpA==
X-Gm-Gg: AYBFou1USXGHXP0NrBLF16TXk1wd6cvdhzBu6Xcwj8xq8M3UzCl7unkGnfasUoh3xi+
	lkG14Ye/sdX2PzTWWX17m7T6cSJAsfflsj7HEOAVm8OmEiyRmw1bPBEtW/ufZtm1iDFJIDB4QoB
	TwGPKAMNimRUeiqCi0I3hMMyNuDwttW+wTlfJsTjJ/xAC89RJjUZZyJlsTBB6VkvOmMnx0PQt3v
	MiKwyr0YpZD2STlGK7CXfc+1HtiAsudjbR5JrXP3gg+eP74uySLMjkDYsHaSpxAa7vw1qmevaWv
	FoC7Ft2GhIPDasFuBU+w0ETWDehuTXRG0BSfoHGtzbswpKu0ADVbjc6lgJ6w1tXPU3i/C/QDYAR
	1NnR6q6ddjS9J/GdDcXxc44KKdV5mZdEp7Ret35L42Iz+J/o8gT+Yk1w0GxruZxW1tfF1uo0TRj
	FHb+C2i2At4waITNMTd4dF4gMYpT+AUBL1/94kCYGVp5KS7ItcfTuiI1gwql3Mh0Y=
X-Received: by 2002:a05:6102:850b:20b0:7d6:4713:fbf1 with SMTP id ada2fe7eead31-7d64714075cmr111494137.44.1794492648093;
        Thu, 12 Nov 2026 06:10:48 -0800 (PST)
X-Received: by 2002:a05:6102:850b:20b0:7d6:4713:fbf1 with SMTP id ada2fe7eead31-7d64714075cmr111485137.44.1794492647559;
        Thu, 12 Nov 2026 06:10:47 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e271378sm81817775e9.13.2026.11.12.06.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:10:46 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v11 0/4] crypto: qce - Split the crypto driver into core
 and crypto parts
Date: Thu, 12 Nov 2026 15:10:40 +0100
Message-Id: <20261112-qce-fix-self-tests-v11-0-b86a65ee7107@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAODI9WoC/3XTS26DMBAA0KtErOvINv5GVdV7VF0Ye9ygEmgwQ
 ami3L0DaROkGhZI/vA8w4wvRYK+hlTsNpeih7FOddfigLGnTeH3rv0AUgecKDjliipGydEDifW
 ZJGgiGSANiQjLYwwcopWywA+/esAds/r2juN9nYau/54PGfk0+8fJHDdyQknwlrHInAuCv3Ypb
 Y8n1/jucNjiq5jUsVxKOiuVKIH3vBIBgo9hRRILifOsJFAS0WCiTjPl1YokH5KmKitJlIyKQrE
 YmeF2RVILaSU7NcUkpdYygozKr0j6Idl8AUeNkg9V4JoZF5lYkcxC4iwrGZQY1bLURlmn12pnl
 1L+j1uUKmwALTho6+KKxOidYpSVWQqzpkRi3bgrjZMyl9/11rg9HE94C4Zb9xaVS0CmTfWw27R
 wHsh8ED5Tox8gJTdfkd3m+XfhngwkUvXdJ7SkcRU0GMXU17qSlfWamhL+d+MLhnH9AacHJB+UA
 wAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5205;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tY4wrzlPcMafKggMHvSTeinesaFJYvReG24LF7j+WIg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9cjkrOFV/ITcgwO7mekMv8N0hW8IWto+PxU0d
 f4VZIPyfRaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavXI5AAKCRAFnS7L/zaE
 w6ShD/sGfjkzjpSRkNbHcvSA3JV2p0q21D8lX86ZuGZm+//LyMBvw9OtxAFaKHJyd7VOYlOVkuW
 dH38ySYGISnTjwi1vbKhO6mnitS8ZMv2S0cdKDbzDvKhIw0Xqt7xR09qkHE3QslitQMp015mHpI
 icOu9rgCgCrNDWOtpcNNtx6zLNcai/uD+Ks5YHZkxcsrODIkUHzW+uBSj4MXY5IHvkpoYkiWrux
 BdueoWIAYr4zQStDsV5v4OUKz3QAjZEAO6Gy5TBMMOFkxxwQkhMpFu2vGi5HKm7WG+61cTSlptP
 lUJjT2uqY7XFfAkF+AtVUy/aUT79D+aD9ukXHnEkrK7SindPJHvuyXga2isOkmYYQH2KEu0Z9DH
 hQfGEQUS8mqZ3+c4hn4YjVtwr89rIEzJx5i+nF+wo6eSWi1mCa/ZrClcryiPvGUPN5r1xwwNYgF
 ScgUv2/0C/gn2nBHJojt41UT+EiVXF7dWLzs46WWNJC28414xFCzPQ2w+nMQa/W3knvMOP3uuH1
 tlsDKCKUGxlODPZsYlhwMDKKLFttTLp+bJ92ZI8Ih2Y3QxB4HdEKv4hAmG5JeckercKctKXhmiV
 swOFgQwIhilb2OjQT0+csyTazYjYKs3MUjvhhXr0jVoDEy4j1ZYor+7YL9pkXvqJW1czmwiYHBN
 LVLOO9GDizftAGA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af5c8e9 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=mX25IeO7DPU1pHUkNG0A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: QJ8RwdcPYb4B0MdnDG16wIyDY6BSeE0U
X-Proofpoint-ORIG-GUID: QJ8RwdcPYb4B0MdnDG16wIyDY6BSeE0U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NiBTYWx0ZWRfX05ZlPK9Ex1g0
 ATTeO3i08WMccLZEvwjroF1xLygnPitHGTVo3vrMMR0dfdoOnkmakKKwYduqhmfgxRXE4bMvsj2
 khFEJhDigu45o7MTOPEpKIG5EOOwCnLsweEB3VLkgVam4+rJ2FQknyaSjSKtr0x5XP3NKgMb4X9
 Y6xY/ZlKR+z4Q3P4w7w9TiSBKHei9WH//EF+164rTjeI4oP5+HEldr9aM+F790zua1oFqm3WnRC
 CNzRFywzd5FS31s33bc9neXcfQOJZFHDyb3txI4866TT5xyjp1Cp6sLOMYRvBHXxce6sSn7Z/Da
 I3mVdT82rVIgxhJa/WarLprLlzu1mn8Ws1prr48kJP70cm/5cbsL0iJ8BAd9EMO3THZ53Y0BTee
 73lP0LCuSfoVR/Lpnl6XcasPmTL+Iq1Fp9wBXE+dPwEq5N+Saq69/g/SoH7hvdb7Y6nftD4Q0ec
 zp4cKOOz+xJVR+yb9Rg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NiBTYWx0ZWRfX870A16eUMIce
 ZiHzSpVAIbWqlbiDk80uKjFJcPvGvkR90eT5/HtpmDEZ9FQ3Xdue9pUQgZkvGrVJrA6lAw90/ey
 eJJYDh+kDTfV8iM9ySrl38qSPFJmluo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_061049_940683_AD956E5A 
X-CRM114-Status: GOOD (  24.29  )
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

 arch/arm/configs/multi_v7_defconfig |  2 +-
 arch/arm64/configs/defconfig        |  2 +-
 drivers/crypto/Kconfig              |  2 +
 drivers/crypto/qce/aead.c           | 12 ++---
 drivers/crypto/qce/core.c           | 95 +++++++++++++++++--------------------
 drivers/crypto/qce/core.h           |  5 +-
 drivers/crypto/qce/sha.c            | 12 ++---
 drivers/crypto/qce/skcipher.c       | 12 ++---
 drivers/soc/qcom/Kconfig            | 11 +++++
 drivers/soc/qcom/Makefile           |  1 +
 drivers/soc/qcom/qce-core.c         | 92 +++++++++++++++++++++++++++++++++++
 11 files changed, 173 insertions(+), 73 deletions(-)
---
base-commit: 6aa7dbf8ad5ebd3babf53a4d6209018f86939f17
change-id: 20260610-qce-fix-self-tests-492ffd2ef955
prerequisite-message-id: <20261112-qce-fixes-broken-label-v12-0-7b5b9c7083ed@oss.qualcomm.com>
prerequisite-patch-id: 06a8db6bb7eee2d6c76312712f089686b15a7fb5
prerequisite-patch-id: c055978d60dd6978c60ea2bbf94256ab2741fc46

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


