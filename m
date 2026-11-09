Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0B7606D80D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 00:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jvLyzmx1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lz1yOYjp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YFKLW8KNYAJNpwdl3pS8AB+PKg8ma9J8S7TqNdUzcMs=; b=jvLyzmx1wjdmMQ
	3D0lSdAJEyYxfhDFhcIutBFK383NT/k83QyEa6SuiY6jxzLdt5U69wccmMJFBnbBedKAdb2PUSTsG
	T8nqwCRcaEYhOQ7TiecjVFPmcEV+Hz4gbGTf3GxpRl5oE1RYWwbvfdZBZ50wAnDSTUGTLYa/D/Qzw
	bvMj/0SUQpbDjBNu4n9h0jNADdXv+WvYZm/ElZcs/dHtqGAKUE3voE6CFN8SMNtCie99UKQFLtJ3C
	19D+V8QN6+2bBvUdB3rfaBNxGQHHMGqPxBlnNtmK4laim7cOWe0TTJDbvReFvRKGQ74C3nN6Evqlx
	LP5Nb3Rwu/AjjV1us3xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDKG-0000000Gxzb-26AP;
	Mon, 09 Nov 2026 00:33:32 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDKE-0000000Gxy7-28m6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 00:33:31 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so228831f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 16:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184409; x=1794789209; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YFKLW8KNYAJNpwdl3pS8AB+PKg8ma9J8S7TqNdUzcMs=;
        b=lz1yOYjp2puMLkmteMMKQBUVHZtlQ4ux9Mv66Lzz7NDWaXam9xMX+IfEtSnHy4z70E
         cljqMjfuj5QQMgAQbzfwCOJoFTDP9mJhTop8tXmaZzeMcbue8rzAbzM0hoGJNDVT+G3j
         cDttbuR4P7ykTLY8LhsRsSUQ9ia3soKvjEkXI/HPmmf4RVhqV4WYrusJfXbHOQIRC4zQ
         wKgvfE/+j3TLSfASZkYigdASxfLj6sccB4sXVY6+LdR+8CPIi3nKEh/moHjr0zRihfOM
         0B/KQJgph5AypckTxxBIPaIvxpBx6xIfyPqHATkYekPLKSts4T/W6SN01XAohGimylgf
         J0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184409; x=1794789209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YFKLW8KNYAJNpwdl3pS8AB+PKg8ma9J8S7TqNdUzcMs=;
        b=K0Z9+dxjvMjt01um/p1QHrov7tknvMFGi5bUPEdz5EznbiNrDJQk+gN7gQALryxgqP
         i6jvHGUbO5SBy3b9GoMIgoEsK5k0lWE+ubIP6btUCPeHEhzxIRy+pkpGk6lRzkOE+9Fh
         ZtksV2i6tIh7+YKyCIQDr85Uuut1rSWlw7KLmUHU4KJ5BPrGtZw0WpZfc+UPzynVOs+R
         OPgEmsMxCExR9UrtKkeCohLbUpDFsNllt2jNKxQe0T3YC94beS93iTRJ86FtbZ2nKj0t
         X7Ch7j0IJHJe5gQh+hbquhkOWLUsb8Al2XwuyQBlk2S43h1rvU+OBA3qyPfoy2AJnF25
         lk/g==
X-Forwarded-Encrypted: i=1; AL+hErEWRBaRXjsTrMmmBOi7QN1SuADQ3ZNCrnq7bLCyBAmJjOiR5K9nLcYOmSHVY9RZg7IV1AKxtb9enMJ8KeOIq4G8@lists.infradead.org
X-Gm-Message-State: APuU4Z8n+pVcbsn/QctOxZRQo2/mIqEDEivaORSAHk9xMaDBP2b+e/74
	9p33gx6nG+c2WE/G5quRO00ewLBZlt03dcEyKHu5Veas1F6ssuS9C9vO+bZXxH8qElQ=
X-Gm-Gg: AYBFou3N+JAscXO+wbdv1NYAxCjv1lmngFfnPkVMRKhT73qU34jmeLf/Z52P8P1l6EW
	8yg1U4iHqEdAzjdQdgwgJnJIiZp/Tzo+2LAxfN3XcYn/EfthTYQl80iszP901+rmYcLUsowe0ze
	wx+3c6HL2iqUGkI6irWNDxx6HI7bU2yWJOM4BxwFq1PrLAw4P/KoPkdiqbyG/NAzbWCD+f5ecMN
	opseo6YLQml1cfdTsDp+AO+uXyETmDSSSP0TcBlPvUU5dJM89gLA5qucu99I9VYoUfkO35mNG0y
	L09dVz8PmjGZhYZeB0toYcC+bRbkO7QbdTnTa1HidKXRIrVCrpxmy2ysLYeZ3nZGlBKq1neV+Qq
	Kade9IwZ2p4Fk/vFhXG9HjtXR6H2CiZ8TTEFcr+6Sgn+/OPUpY7XApvHysGntiVjSyl1CSvf1lx
	p35yFbAeqdPWqFY/Bd8JVnhFzHSFqTi4g05bu3tu8lNr+sXpkEZx9oHlwjigeiXHAAwCPh6ZjRs
	Nm0ERnsl99+KOhWIejj6SLqU0bK53ynDlLCj7rz2b94fIDZeK0KTnzPdoEUuWB2Qtmd0koijQAg
	jbBcPFJKBnm2cIeRZylrXdJciJImrES+DztEteKU
X-Received: by 2002:a05:6000:41de:b0:487:6f2:1a4c with SMTP id ffacd0b85a97d-4958363aef7mr5202460f8f.25.1794184408539;
        Sun, 08 Nov 2026 16:33:28 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:33:27 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:13 +0000
Subject: [PATCH 01/17] dt-bindings: arm: qcom-soc: Add Halliday
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-halliday-dts-v1-1-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
In-Reply-To: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=1550;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=tUWocDfAfCJsF3v3OtoKwfhNWUHIfuzBBTQPqmsMKT4=;
 b=6d7YwzTFYjop5p0/v6W6IN2CR4pGsNNDgYvAeTsTx60B++SOP4IVlql7QjUftzoP94efcMQBt
 9wyXGd+1Qj8DJV/y/ijna8Tz4UO7i/9OTJJYJc+5QBZZdn3iTw6kOCC
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_163330_560338_C25712DA 
X-CRM114-Status: GOOD (  12.80  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add Halliday to the SoC codenames allowed in Qualcomm compatibles.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index 179aadc86a9f..9d392329d437 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -30,7 +30,7 @@ select:
       contains:
         oneOf:
           - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-          - pattern: "^qcom,.*(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
+          - pattern: "^qcom,.*(eliza|kaanapali|kuno|glymur|halliday|hawi|mahua|maili|milos|nord|shikra).*$"
   required:
     - compatible
 
@@ -42,7 +42,7 @@ properties:
         - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
         - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
         - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
-        - pattern: "^qcom,(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|nord|shikra)-.+$"
+        - pattern: "^qcom,(eliza|kaanapali|kuno|glymur|halliday|hawi|mahua|maili|milos|nord|shikra)-.+$"
 
         # Legacy namings - variations of existing patterns/compatibles are OK,
         # but do not add completely new entries to these:

-- 
2.55.0


