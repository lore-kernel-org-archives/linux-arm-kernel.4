Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011DE606A331
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 14:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fl7JBzdj;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xFYxlDgD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=g/yvbWQwS0D23DkQr1LFINSHz9ilePwn2uGIL92kEuU=; b=fl7JBzdjn9xm3M1yeZ4FYXTyji
	fRzQyFfCq+QpBp+4E+OOxRhjIyqsBPeixZCciTq5XriyAg0HtZXe2Ek6SPCnztbzQvKWOlWb+/Z9O
	+6fdgWaWPb2ycweVHUQzUpuuAc9P+XWKqYC/+KSLhGa/8OkwpPCVBkwRUey8qMzpAAz4ZTX84gfRR
	5m31l6DVqpA0ce/EAotalWv8yFwzqIPEuwDHKwEmlaIGFmZ3RAGib6eNv10KdLaTMc5PxGUo1pu1g
	bgtksQ3fuf+rUqzERO/2YajQEimC9I9ZabBA2Fx0Zoe+S+okLPU0WGQBmSSmuUEcQfNxooXv52poN
	2vFA4RqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSEep-0000000GFYe-0APQ;
	Sat, 14 Nov 2026 14:23:07 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSEem-0000000GFY0-07Xn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 14:23:05 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-53fdd2fb171so33095801cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 06:23:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794666182; cv=none;
        d=google.com; s=arc-20260327;
        b=VagsC6douTxZWi6ZBowJoH9zjYAAqRLR7EST9u668P7+UdQ7kgu4M5ddDL+dFdjTyw
         vnRVIvd+8gsmheFSAOnMf2VK+0+wLzz1Q6axHBALT384AUa46cSn3ztsu93gLmyFRQ1P
         Uvl95evp/8Umq7xLJ+7VHMSDSLt2O59iUm4GKLBke8XsSCP/ARvWV25f6y7OEw47Usir
         HlBxGiLUUdACSnNN45R/pAlDrGUurhkI0E/pIBlKUfJ8zXnW9RjK6wpm4F18u3lmZrgK
         zWi9CbA4D6rm4STR8YuCGYC+BhTjVJi7Axo6rUGMMOua3xDkVQTsLjhVpt8bCdZFPZ95
         cxVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=g/yvbWQwS0D23DkQr1LFINSHz9ilePwn2uGIL92kEuU=;
        fh=XH6IMlBD4cl7yQh4koGZO6FTIriKYK/gOqVdpna/J5U=;
        b=r6JYm8q2OZl5E3+f9AsvvqG7alIgKQuWkpQ8JU1GAlsrt5+NIe7k6PloQ0s/LUC1gk
         WqPqERDMruA6Kyvn1yS1dtTsDjETLCR+ua2NyrRnee2thgi0/vbmepk+WRh+pkzD0fR6
         E4+r8MIaHDp647HPbZBPV5K1ciagF2cmpDVd/uKlXl/g9025/v2ip815LEqUEzikQB6y
         Ggp99V1cw0X03Dif5PT/zGjsZ/NXlDia6i1Qj9c9XrlsBBTSxYgchIhLA4pyvn28wibM
         vR7jc7wPwF9tdQVRIL3b2ZhDGA9IFBh+E0qv4f3dlxjPvsrG1cc60uxqRa2DYeYz4rM4
         DNjw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794666182; x=1795270982; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g/yvbWQwS0D23DkQr1LFINSHz9ilePwn2uGIL92kEuU=;
        b=xFYxlDgDOaYVvmwjorLlJWFEDe28nGVdWQETSc1ntLjoh1eG7oXUF9YkCVdop13+6U
         3OjyIbM58n0fa3PF63SJZvOAOBN6uniu+ogfW6EgsJOqPlXd11OPDj2zxkySboDIrr2s
         ld0h/URxujgfu0mME8zdQ0hm4eNlXbFCMIL2oGRtPsIKL/3PdvUGVCx1U5fNaldEFd4o
         nIf4PHP4fbJ+ZrQNgBkpPvK8UdGNi1nOr/+EkFmYITeyuihUnt5ooaZg2TiNO4YllC8w
         49y00ZO2GRpjhGN9aHDsTnoSsJaeBSS/zLPx9+AtRnOFGje0ZW/TDDSKi3BcjPp5C5Sc
         NHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794666182; x=1795270982;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g/yvbWQwS0D23DkQr1LFINSHz9ilePwn2uGIL92kEuU=;
        b=Wo/+kzBJzUd11SMd2DPs6xy0IrpLHU8AKbJeIJbS1IXSzbHIgXq7Z031h3NUKBBL46
         k2OWYu2HomXEOyMlvRZj2MHuvcxl/b8QbOVwpVtE2/exLcYR7gGZN4+MEMOTImhtLfIj
         LeNYVHec/XC8e7wboweMz7BdZOCfpxQ/Nb6goy7An9Y9upVKqKN2/StB4uJihjvfhyJm
         cwR7Ad1RaFJr0feRPJ97h7zEkCd/crTBekgnPonEeIDEVrMLEPPxEBts2WGgjqeHHTOu
         ldhZEBO4RZXMr+S8WNximBXGNfXqtX0T6efQbX744t5udkwGwg2NpjSHZ69JGu+tAuc4
         0JDQ==
X-Forwarded-Encrypted: i=1; AL+hErG1QPy9HXo8PfWFW4v13mkFtsEEpROhVuIPQd3res0+k2uptw8x6YY+8nJrD1YJJv5n/FvkN9hqd5uNLl+tSw5t@lists.infradead.org
X-Gm-Message-State: APuU4Z+hqehNR/pcSkZtDP77iNTAyCXp5YSDRXxft5Vc3+FjEe1PNCEC
	+bstLZfMxMJvfNE2NIsZxOc6qGha2k+KBAJC28ogTDC/abgihwaXwma1r7Md4jFnI/nfwfE7OUe
	sFzfWOxUMx5RdFmL+veZq4RebyFqVCJujvA==
X-Gm-Gg: AYBFou1+dg0fQr51qVZFE7kMGfIYcV1tjKA8+Z8V8xHg4ETxIZbD8JC8YtIzOqD8u+g
	I7DGxKCVOtEQy9CteMjEYOPiNOCtBULDJ1q2g/7OlBNrT5uplQzeM/nY3B4pXbyIK0sY2kdq3dU
	49/nOI1A4Jvy2QKxsGL9xEy7cV4OMES9oysVOHo6ByjiBgGGGozh/xNb/mmSQSTILXjvVk7z1Ac
	KzjOVGJx7GqxU9rycaNunRyvnHNIZMBobimyZ+SH7UOxHPshc8KIl0J1J4JAF/s8t6fTCJm+S6T
	j9v8uYyv+craBiDrlYB5HUHEra5txPzVmSkBT8awoCzXT7Lw6vkJPp5VRJQxmhX5Nd5tKE3ZHN8
	EeB6S9Ujf9q5ROnZtBCDtbRKeBkoQUZrUVFjQAvd3h8avLxben8ofnCr2srTc43b5tQ4l
X-Received: by 2002:a05:622a:4d43:b0:55d:13c7:c22d with SMTP id
 d75a77b69052e-55d13c7c71emr12350761cf.73.1794666182235; Sat, 14 Nov 2026
 06:23:02 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Alex Guo <alexguo1023@gmail.com>
Date: Sat, 14 Nov 2026 22:22:51 +0800
X-Gm-Features: AclHuK-CwagvkWalezrhVz50u0px-Nhi_i-hMu9i1eMIeBIShkcfnpv5nVgK5r8
Message-ID: <CAAi4Z-fjR27iAXjb6VpovSVVObqLcLgurzuhCkDFqgGafyAaDw@mail.gmail.com>
Subject: [PATCH] bus: brcmstb_gisb: Check required IRQ lookup results
To: florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com, arnd@arndb.de, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_062304_079781_23E7A1C4 
X-CRM114-Status: GOOD (  11.10  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

platform_get_irq() can return a negative error code for the timeout
or target abort interrupt. Passing it to devm_request_irq() can
replace the lookup error with -EINVAL.

Check both lookup results and return the original error before
requesting either interrupt.

A similar issue was fixed in commit 47c3e06ed95a
("spi: tegra210-quad: Fix missin IRQ check in tegra_qspi_probe").

Fixes: 44127b771d9c ("bus: add Broadcom GISB bus arbiter timeout/error handler")
Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
Build-tested the affected driver object with Clang 18 for ARM
(multi_v7_defconfig). No hardware test was performed.

 drivers/bus/brcmstb_gisb.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/bus/brcmstb_gisb.c b/drivers/bus/brcmstb_gisb.c
index 113a09e10328..c0dd2e3205ff 100644
--- a/drivers/bus/brcmstb_gisb.c
+++ b/drivers/bus/brcmstb_gisb.c
@@ -419,7 +419,13 @@ static int __init brcmstb_gisb_arb_probe(struct
platform_device *pdev)
        int i, first, last;

        timeout_irq = platform_get_irq(pdev, 0);
+       if (timeout_irq < 0)
+               return timeout_irq;
+
        tea_irq = platform_get_irq(pdev, 1);
+       if (tea_irq < 0)
+               return tea_irq;
+
        bp_irq = platform_get_irq(pdev, 2);

        gdev = devm_kzalloc_obj(&pdev->dev, *gdev);
--
2.43.0

