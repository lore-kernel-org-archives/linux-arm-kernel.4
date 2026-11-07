Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE84C608362D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 10:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LjEtMGQY;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XoVJ4sS9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dQLJpmphacfFTl11Iogdju/yebl+ZGbxqtObyRPsnVM=; b=LjEtMGQYe3eLcptD6lGUGGEZtM
	IhbSPNuZEArS9bx7HnusndMktLIVU8+Z9zV55P5IIjYTCrJj4V3jON3hkDuEbYlYKIjaCfx/xdIcx
	8drykhR3ABcFsYRRuSAQzM+Ppa5UxS0FrjHMrOyKu/TQFBRCPjnA/OBw5WKE64jSqJD9BbL7ftlTp
	OGa0KS+VxmxmcQVweuDxLzaWNPr9RcuvvD5af/0+HlZidJ9L5rE0QrKGLF6STUKqLUfzYPtlHf0f5
	YQ8hG9ydwDDXAlc8TaNIFiZLoJQkG+VWRPOT1dJIje3lRHxVk6jM7oUe2o+zo1O1QG8kYgMJZ0zh+
	HKdWi2qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdyu-0000000EY5r-3vIv;
	Sat, 07 Nov 2026 10:49:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdys-0000000EY4y-336v
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 10:49:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DE1FB601EA;
	Sat,  7 Nov 2026 10:49:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794048545;
	b=tBVUPKqonanGdaDkbliqWtVi4tkMd0gk4eUU3g85cR4O8t26T+XJKkwXfRy5Udp+frUb
	 PPhAkE1B2i4fIDzk50UsPkut9IA5SuxO8VpqBDspcWX9MdyemolAFLTekIhvkC6kqlck4
	 yYHPDJbkfzxpcGPT1pcVXosUJ81hTDaQNKGjJ6iU5T6y/o8b5HB1Xufmp61ShjBCLwl9q
	 gR/RwEgTCXuGZ1moAjLLmDQVZpHbA9QSGC/z4x5U6lvzVXqLbHh5pNFIuRKrJxuA2lPJp
	 0ui0CDdTQ1grcj3A3cHEkQA9LqFS1Kn9VD49aRj0U0Ya7glGvAx/7unuudn2KStC2NA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794048545;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dQLJpmphacfFTl11Iogdju/yebl+ZGbxqtObyRPsnVM=;
	b=1L4X4fAPR18PYXL/aWQByfyi5r0KofUA/L1YiIU6txL2tVt682JdpSfg0YNTNAtuxni/
	 2Whxytx3Dv3DIfo+EWFl+Jyrz0Y2flVNuYzPACwCHeCq28LmrzinHlhVMUGdyW7alKxdy
	 5VXiVpL/EpDOKFx2lu0kVLsBhT2QNfdG7e26yu78j+VzRACV1Ep42Zk9rWB0vJ9soF6v8
	 +TpZKkh1/dyBT+tA0HrK5tAVssGOz85OhQzOJFVKyAbkAsoI1OC5/XmrCpIKTfxUAuBif
	 toitLUfSDMc1JZKBiGwfviY9CG/IReDBEEH8S4DiPM294DbL1XtJmGR2LNcvm0hEXsg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0B25D1F0089F;
	Sat,  7 Nov 2026 10:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794048545;
	bh=dQLJpmphacfFTl11Iogdju/yebl+ZGbxqtObyRPsnVM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=XoVJ4sS9DquJzTW+YVQKR4yDhH1VFSDf67F7RHmRBCFcWq8VSZJE6yWe4d5Ob9hE7
	 xnvGEXaavnP/h3M2FK9ueALP1uW1z1D9opB7BdN/Em7Tbbxyby1Oa+Pgsg7iNoRCJt
	 EKLcfC9+KSXb6FhOgjcSOxM0akD7PjZdgu4/PV5CBH+BczNXyB8SqcEq9atRC1u9+V
	 K3+Q3+yfEAO+lVh6vHp5NPO407H9TWRNWLSLOEAXVRLl0qQt7OgcpTakQSxFa0EsUb
	 i73IC0kj2vQpZKpipxH4samhzYnywyClk6ZYnAIy1KhjRNCDuxOAJqby8GjGFH/pMY
	 zEjRHUvAZsVEg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 765EB47B65;
	Sat,  7 Nov 2026 10:49:04 +0000 (UTC)
From: Myria Sarvay via B4 Relay <devnull+myrialsarvay.gmail.com@kernel.org>
Date: Sat, 07 Nov 2026 21:48:48 +1100
Subject: [PATCH v2 01/15] dt-bindings: arm: pmu: Add Apple M3/M4/A18 Pro
 SoC CPU PMU compatibles
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261107-m3-plus-pmu-events-v2-1-acf1e78da039@gmail.com>
References: <20261107-m3-plus-pmu-events-v2-0-acf1e78da039@gmail.com>
In-Reply-To: <20261107-m3-plus-pmu-events-v2-0-acf1e78da039@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Yuvan Shen <yuvanshen09@gmail.com>, 
 Myria Sarvay <myrialsarvay@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325;
 i=myrialsarvay@gmail.com; h=from:subject:message-id;
 bh=/RhkmR+AowbpjqK6Gl7/U5BQw712i9wzEL0R+lg9Y7Q=;
 b=owJ4nJvAy8zAJRbk4iixYu2/l4yn1ZIYst4zSZ+Uebk/7p3ZeceHSsa//lU9z43fcJ1v292fi
 31YrE7y3FTvKGVhEONikBVTZNE3TdOezNZwqXSZ6xaYOaxMIEMYuDgFYCKp9xgZTnyaxXP8GO+k
 iD271BdNqpgx5dXxeoNPZ09HPn21w1KzUICR4fDV1VnRzjoLj7RtML0YtM07WoBbKjnk+/T5be8
 5065WMwIAEOlMFQ==
X-Developer-Key: i=myrialsarvay@gmail.com; a=openpgp;
 fpr=2F35662B930680D275A645B452444118A8ADFEE9
X-Endpoint-Received: by B4 Relay for myrialsarvay@gmail.com/default with
 auth_id=1027
X-Original-From: Myria Sarvay <myrialsarvay@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: myrialsarvay@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Myria Sarvay <myrialsarvay@gmail.com>

Document the compatibles for all current M3, M4 and A18 Pro SoC PMU
variants. Note that the M4+ are split out by chip codenames, instead of
name for the types of cores, as they no longer have individual names for
the performance and efficiency cores.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Myria Sarvay <myrialsarvay@gmail.com>
---
 Documentation/devicetree/bindings/arm/pmu.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index f47baaefcdac..c27f06e82de1 100644
--- a/Documentation/devicetree/bindings/arm/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/pmu.yaml
@@ -22,8 +22,16 @@ properties:
           - apm,potenza-pmu
           - apple,avalanche-pmu
           - apple,blizzard-pmu
+          - apple,brava-e-pmu
+          - apple,brava-p-pmu
+          - apple,donan-e-pmu
+          - apple,donan-p-pmu
+          - apple,everest-pmu
           - apple,firestorm-pmu
           - apple,icestorm-pmu
+          - apple,sawtooth-pmu
+          - apple,tahiti-e-pmu
+          - apple,tahiti-p-pmu
           - arm,armv8-pmuv3 # Only for s/w models
           - arm,arm1136-pmu
           - arm,arm1176-pmu

-- 
2.55.0



