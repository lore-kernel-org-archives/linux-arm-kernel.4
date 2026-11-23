Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF80606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MVgkyN+m;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2BRs8kNn;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=orqM62jb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dQUU5u79vuDftzZPq41mVfEGZTZsxAT4nxqA9JHwFwM=; b=MVgkyN+mWIbXuu
	maYFcw4peub2nz/XiAzICMoOhV6oQD73bU52zBQvtbvlivyvbNM4B7r3ErtMVw5v6XEL+SjJbcQtX
	veZcEWlZYgfDSgk1vp7wCP/XcRoPEOkNYBVWKae8Zi1v/91ZDz1U3IuosfJ7HNhyZ+sfmjAriYuCt
	CCjWg/kEufSAWyWQ81LM2QlOii7Xq5gyIUcyBKx8TD41DUs1whaqnmwoS/jdCJexhgSaFfCV/17+N
	KOqZ0LLQHthYCuDMN66lqGbE2awycmpQlUsmD1ix6xN9vVNV46aLc8h25wnv1IW20EIUoLI8YN6O5
	Z89NuqYY2CEZBUfyTA8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQVh-00000002l7E-06v1;
	Mon, 23 Nov 2026 09:38:53 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQUR-00000002jpp-1f6s;
	Mon, 23 Nov 2026 09:37:39 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795426649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dQUU5u79vuDftzZPq41mVfEGZTZsxAT4nxqA9JHwFwM=;
	b=2BRs8kNnJh8jUvFne0pup0kjd56RKwfZQoVTswB8jaQkT/1+UC3J0057egOH4HK7xFJAqA
	HqCywtOh7slUrHcQGQvefA6eL7zyv5hsSA1zxFFvN/6ge8RI/bO/4bG9ak1pAwLXjgZqj6
	iGcErJRTwGr5nVvFFDPmW/Nm8laVaZu6XMnvCEkeIwUojmTfuvrSIQyqYv8EdmwCWWVV1W
	ki1aQCBFjitTjq+qvrPiLfH9aOLweh50rgCPL57R9s9qzuuIqDA61unszxi5VtgurELgBe
	RanufkaLmGxg3YO/o8/JlKLnrf6Pe3A3XF6OnxlZIDqBXd9EKN0qE98NapY4hQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795426649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dQUU5u79vuDftzZPq41mVfEGZTZsxAT4nxqA9JHwFwM=;
	b=orqM62jbjJv4cXHhrjV4L7jD4t6CApiSqCiCMjGa0zhR8JXKvf+tjoeh2jm1k5ccyk1y6u
	4vDc7mLpel0lpJCg==
Date: Mon, 23 Nov 2026 10:37:11 +0100
Subject: [PATCH v3 06/15] arm64: Remove AT_VECTOR_SIZE_ARCH from UAPI
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-at-vector-size-arch-v3-6-d342dae9e843@linutronix.de>
References: <20261123-at-vector-size-arch-v3-0-d342dae9e843@linutronix.de>
In-Reply-To: <20261123-at-vector-size-arch-v3-0-d342dae9e843@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795426640; l=1590;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=y+NTI479tyoHV6O0h6k1NetFm2TSA10tCjlo/HGZYvg=;
 b=R4duhjDRQUXysUPjCyGoikenj+2lzks0w9tUzNKNfbwsEci78RXNuIVq9fOyG8pXBz36DsOCf
 bTSsZCwaQ+5AeQSIEa48ysbBSHeolzWma3r0l38rQVQGcphJQ8frdez
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_013735_613515_DDD41285 
X-CRM114-Status: GOOD (  11.50  )
X-Spam-Score: -4.4 (----)
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

There is nothing userspace can do with this value. In the kernel is
always combined with AT_VECTOR_SIZE_BASE, which is not exposed to
userspace and also changes from time to time.

Move the symbol to a kernel-internal header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Kees Cook <kees@kernel.org>
---
 arch/arm64/include/asm/auxvec.h      | 7 +++++++
 arch/arm64/include/uapi/asm/auxvec.h | 6 ++----
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/auxvec.h b/arch/arm64/include/asm/auxvec.h
new file mode 100644
index 000000000000..de24eaaa06e2
--- /dev/null
+++ b/arch/arm64/include/asm/auxvec.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_AUXVEC_H
+#define __ASM_AUXVEC_H
+
+#define AT_VECTOR_SIZE_ARCH 2 /* entries in ARCH_DLINFO */
+
+#endif
diff --git a/arch/arm64/include/uapi/asm/auxvec.h b/arch/arm64/include/uapi/asm/auxvec.h
index 743c0b84fd30..fb51e906813a 100644
--- a/arch/arm64/include/uapi/asm/auxvec.h
+++ b/arch/arm64/include/uapi/asm/auxvec.h
@@ -14,13 +14,11 @@
  * You should have received a copy of the GNU General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
-#ifndef __ASM_AUXVEC_H
-#define __ASM_AUXVEC_H
+#ifndef __UAPI_ASM_AUXVEC_H
+#define __UAPI_ASM_AUXVEC_H
 
 /* vDSO location */
 #define AT_SYSINFO_EHDR	33
 #define AT_MINSIGSTKSZ	51	/* stack needed for signal delivery */
 
-#define AT_VECTOR_SIZE_ARCH 2 /* entries in ARCH_DLINFO */
-
 #endif

-- 
2.56.1


