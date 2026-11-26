Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8562A606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 02:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IE5kCb/A;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pBByYaLw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Bm/bUp7RlKkBT/8X38VbZu3Ft5/2WN63tbel6a0QUxM=; b=IE5kCb/A6DgPro
	iBQ2U0kQxeFLjlLzstPK+2pZQEYRy0o6Ona7LamnTmdqyxvGjkROqsO22NNFY7DKyHWlBXTyzCkiR
	boH1BX2YE6buwphvIbqzAIqrsiTcuyIRYa60WfAq0vjORg6s9O4UJoHrY51vnarfkCEShmA6xPH2W
	UN93mWniLHvIBj9kO7n8PASgHANtGeQqp/9aSP7CbssCupJ7OwXrZ2Nv9G5JYZvfSfh4ASwEahSvn
	JV2pGfeYXyoO0JDcQLg4MVnI10W9Om917OmKdYpX5JCGxAaGhPLt0AEAGXq9Bcw1XQXx0Ph0PQtl5
	SJE5Tzz/k6zC1bxHSLCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPOH-0000000BvDh-0lYg;
	Thu, 26 Nov 2026 02:39:17 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPO1-0000000Bv7o-2Yr5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 02:39:03 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3b4cd193b50so1638846a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 18:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795660741; x=1796265541; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bm/bUp7RlKkBT/8X38VbZu3Ft5/2WN63tbel6a0QUxM=;
        b=pBByYaLwBaSKoNI94bvvZg6MsDg30goubbvQdezcUPCtfwtUnap51ou1nqFg2zrO4r
         fOjDsYUsD4S9bMon889v5vJObrk91p2IO+ap9aWDoSHuq0yr86TtqKuUbvWgm57cacrC
         ELC+7yihlRxW+G2BDxVytodydclJeGL2io/wMwQCSGD4iYvLIF7s0fiJ46xQ1bARvjdT
         uCbTNijBRoxxEJIQjvAFOOG+6y1nL6OE4fo/ApN38wtVofk1wbQLfKrwHCQfvC0/XB1i
         UBPQ/PXni5yusILoXGancy7kgB385/3CCFPrecm2Z7sKPOoPWetEt+JB68iHJgsstcbz
         vLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660741; x=1796265541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bm/bUp7RlKkBT/8X38VbZu3Ft5/2WN63tbel6a0QUxM=;
        b=xma4rNsBsRtD1fImfzme8GgHaxMm/RvZBGZkbfivLlHVdwkXXwrQTU9ztM4nzyzZMm
         pCFdkGRK0T7mzZx792TTBCGQXZB9klS0cQKVPcOyqQ9XYgjO127PP36Ez8C2uFqwtsnz
         ivYQBTCcxYX4NeW8INL+Khe8oNc4YtUQB6lDWIuUeVLoIVKNVKWRXOyHMbtW5qGOMMdy
         McMOxb+FGe24s/Lmgy/ofs237nP7nWLg8OWwjF6dfKMvR+9yssT6hTHKOi1zHN/sdCPT
         2XS20qymJFvsSRNxquVuqU4HT2raYSdJW+xMNI9jknaaFrSE/ji9lF5JAvxxJyeOuNmM
         2IVQ==
X-Forwarded-Encrypted: i=1; AL+hErG5K8S01GH3qtYXoEXfijJrqj9L6tHimhN1wITN8M/3r4AdfvCceKv9Dbuj+T+3arIhm5iQquH2RWKM8utxcxdF@lists.infradead.org
X-Gm-Message-State: APuU4Z9YNhNyE9mqd6PYbeYkc56B7F9HSc+nXCpnoBNj0AdYiXJQvClW
	oNJh+B4a6YoTkI5uQqUh7Ufv7t0X7ld0zMVDh5qVn9ZO9sTjoHCZs/NV
X-Gm-Gg: AZFdTZcyWz9HIXZjLvnlK8nASta7UeCP5iAko6QWuBHTGBxhrzTSM30uoddO3vCTdXy
	7NvnjtVyizR9JsatzwFaN+XjjF8h7IonEwzn+sFpuXku2x/j0AVqsZXik+r0EwAmMO097YxogiA
	K8Kg+9MRDrFLhowWCDBuaj65o8VU0qJszbYTBONKxm+FGeZ9XOkhtZz53ZGDLBWnrz31xkCkzdI
	Yli5ipCFFg9JT5EtnYzGbbkZOVI8ChsLj3SoREsWv5pXJEd0VlvdykroKe70Fk2D6jNk0mcb49j
	puq8+Fo4Mec0cTvHs7zzB1iAsVK3h0lNWOG8xrHt1KlgzgVmFZVprdrmbyW0/wDPMhwl2ZiimMc
	+YpewTgnBVHhRoNrRIQtOMxpWkOtocg5Q5DNmII420mYrgZi0bpMmL/S29EPNoeGB3orZFNDeX1
	24mP/mL8Zce78wKyiiV7V2tC9LcQcg7wdXaJE1YZJ12PEotp/CVilM2344E+BgOwavy6uAexpvM
	d5vI+7pWOiYxzyTt0G0PqZHY2WP78YKmx3/rol4gsXVerJnoQbtPyMPS2kBg0v19kNl2zB7JGmg
	RjK0KiURwFeui7kJwq/HjNX3GbxzkQxYC2GgFTZXymTLhnx1CxArLGDEE5pb3nOMLWjrC8ZkgtO
	vqgwVYhr7OugsobvOKNy7jv1P1vWbWAViTcLqvkQG/E6Mq6M+IkQpnByIuP+EJpMWd26zHPNJN+
	O6dA==
X-Received: by 2002:a17:90a:ec88:b0:3a4:6e84:e7f6 with SMTP id 98e67ed59e1d1-3b41c7b572bmr17367824a91.5.1795660740619;
        Wed, 25 Nov 2026 18:39:00 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d026d6fsm9909018a12.19.2026.11.25.18.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:39:00 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...)
Subject: [PATCH 1/7] ARM: dts: helios4: fix board revision GPIO polarity
Date: Wed, 25 Nov 2026 18:38:50 -0800
Message-ID: <20261126023856.767961-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126023856.767961-1-rosenp@gmail.com>
References: <20261126023856.767961-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_183902_255895_ACCA0BE4 
X-CRM114-Status: GOOD (  11.26  )
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

The board revision is strapped on PCA9655 I/O0_0 and I/O0_1 with plain
resistors, so a strap pulled to 3V3 reads as 1:

  R1.1: I/O0_0 = 0 (R67 pull-down), I/O0_1 = 0 (R66 pull-down)
  R1.2: I/O0_0 = 1 (R110 pull-up, R67 not fitted), I/O0_1 = 0 (R66)

The hogs describe both lines as GPIO_ACTIVE_LOW, so the logical values
are inverted: R1.1 reports 3 and R1.2 reports 2. Describe them as
active high so the logical value matches the strap.

Fixes: ced8025b569e ("ARM: dts: armada388-helios4")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index 9c106633b2b9..965e9972c9d6 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -181,13 +181,13 @@ expander0: gpio-expander@20 {
 
 					board-rev-bit-0-hog {
 						gpio-hog;
-						gpios = <0 GPIO_ACTIVE_LOW>;
+						gpios = <0 GPIO_ACTIVE_HIGH>;
 						input;
 						line-name = "board-rev-0";
 					};
 					board-rev-bit-1-hog {
 						gpio-hog;
-						gpios = <1 GPIO_ACTIVE_LOW>;
+						gpios = <1 GPIO_ACTIVE_HIGH>;
 						input;
 						line-name = "board-rev-1";
 					};
-- 
2.56.1


