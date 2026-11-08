Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005ED606D833
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 17:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n39cGPsY;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=QYInMVi/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:References:In-Reply-To:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YXcaywW82/OwTpJaNMPSCSwp6PL1lwbEbYBT4RlUze8=; b=n39cGPsYC0qP5LOcOxUfAOvDmL
	Nm67QokBIAdz7TLmwmhS8qNBmlqIM1mV/3VnPltVak7gn4yqGeKPENcWQcQ37wyqSNZzHedsRkKda
	OatSo3dA60sll8CWqcMmCRnyFxjF5u5n52JBhmAnLJrCO0jynSvfSk+CRKS2IK7iROcmUTLa4IGxQ
	lTygbZnO5AlpyKL5k1v3cBOyL6Xj7YzcdVyZxIzwGuTSZZQJxmSkgNQiyrz//L6e0vEccSlwgQT6w
	DvQr+4w5R4Mf0wzlPXJAzplfE2FbuRrStUkVFH71vWio/2ZSJ7Airf07yCjJBn32VWd16Wru+7R8e
	DDl21iog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ6cv-0000000GQkN-2ZWM;
	Sun, 08 Nov 2026 17:24:21 +0000
Received: from out203-205-221-164.mail.qq.com ([203.205.221.164])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ6ct-0000000GQjD-1GmY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 17:24:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794158649; bh=YXcaywW82/OwTpJaNMPSCSwp6PL1lwbEbYBT4RlUze8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=QYInMVi/0IJ1xu5rrNkVRE0OGi6yLvtYPJ6uCGl7kG2mtNeKpyBZ/QfgDQPTfHsJz
	 FcwTA4LzCXyDgb//nV8IPY5XqIuPc0+LMVLJ898o2ALjbACJ9Msll/ds9F/H//gufu
	 KzgxmRyLlnXUPTQDUf5X1vCpho5xrd51bUaXxhnQ=
Received: from [127.0.1.1] ([5.195.0.150])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 5F906C5D; Mon, 09 Nov 2026 01:23:57 +0800
X-QQ-mid: xmsmtpt1794158646t9xll2mry
Message-ID: <tencent_B3A6FAF92249C8215D13A70D408EDFE8CA07@qq.com>
X-QQ-XMAILINFO: MllZffuBkEb5boNCQzmaUwllHI1wfo8Ka7ClInv3/51fNUUapbjuYbgYfimhjB
	 GUM0w0uBpzA3xogDudQnRqcQwUSnZLnPXyueFgW+Bk1cZClF130458+FudhE6OmjNNhHlrQxg29I
	 sBlna+vVU1LiH576UI1cNiNQqctkhQ5dG98tYFPuJTMeQCpuqyBwthR2b6uCQJloHhtHhjvAL49L
	 9hjUYhluCcbu0noSSeWwnbj6uC3i264xv7iILWEhhhEpCaQQRWejdpMsupN/jK9I1qKtPrJjzlZM
	 84o8dq9x57v5/UpEuFnBhUcCDLrBHM0HZlSvWEebvEkQsz0TasXLzSb5MmjBs/KnHOaeCNIyJp7n
	 zZTLeJOYpXUTZ+ff8XlSdrW8k42usYbqEwq0zx4UsMoxzIMT5WNN+MQLJnV0BcwiA8Om5aQzOx0o
	 M1tfPH36gDSWqEKIEaaJrLRFmRbq76dBzhiFvXuw0I5Cl+tUjHUmbLfOw/tGwydPRMEDbVD4QdjK
	 fRdenc+39X3wNwEarJ0wqZbzlbUMuXp0S19kk3ODJFeIQHGjgFf1WMgpqRDWnGX8wiye+5cVC8YM
	 wbsQ9wGN7app4n1XTC4f9/0rrYy9+7tWKE1jKuSquEJlOwXqfw0yLeZflXnjZPV3XtJ8EC+s6pVg
	 LZq0OAw2qwa6ay3djQgnyJ0jzHCniXXod/alnGr1L0AAGNQ0ikgeseA3japcYL7XecNk8hEx+XrG
	 TU0PtSeRTecYS0r9W+xKw39QU0y5KoVAFh2dIWo3K4eyxBZtlOHDisCm+reJqkZEI6WSufNtPRhu
	 MPfZS03slI65W06sszj06jbKan2qMKRuwUhqmYlUKHVe9E9Mvwv41mpFADzFjHgvvhvg8It9rc74
	 AJEcEn8KI8QGUSg95Slygki6eBzjPesog85VxWl+PPItUC6JAtDaM351BPoq7bcOZtbQr/L3Z/Ds
	 q6T2hSDMB8UToYfeZ1LQuNONOBLervkon6vCjNqJkhL+AxHmbcRYZIpKv58kIwpBzdqQFexgINCc
	 6dzQE1qO4cYmT3AjIZyV2o3uducA0abi8HcNLFct0SDFwe2S53
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Jiawen Liu <1298662399@qq.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH] i2c: i2c-s3c2410: fix runtime PM cleanup
In-Reply-To: <aoRq_1DgSUrmR_i_@zenone.zhora.eu>
References: <tencent_692077742B9CE600137EC92B0FEA258A8C09@qq.com> <aoRq_1DgSUrmR_i_@zenone.zhora.eu>
Date: Sun, 08 Nov 2026 21:22:12 +0400
X-OQ-MSGID: <179415853265.5.8299501898122494056@qq.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_092419_713277_546148E1 
X-CRM114-Status: UNSURE (   6.71  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andi,

Thanks for the suggested wording and tags. The proposed ordering works for me.

One detail: the driver keeps the clock prepared and enables it for each
transfer. Could the description say "keeping the clock prepared until
adapter teardown is complete"? This preserves the prepare reference for
transfers that a client may perform during removal.

Please also add the proposed Fixes and Cc: stable tags. I'll use my full
name, Jiawen Liu, in future Signed-off-by lines.

Thanks,
Jiawen


